//
//  WorkstationDateSource.swift
//  Facility480
//
//  Created by Hector Martin on 7/6/22.
//

import Foundation
import Alamofire

class WorkstationDataSource: WorkstationRepository {
    func getWorkstations(parent: String, params: GetWorkstationsUseCaseParams, completion: @escaping ((Result<[Workstation], DataSourceError>)) -> Void) {
        let header = getHeader(token: getToken())
        
        var parameters = URLComponents(string: parent)
        let queryItemDates = URLQueryItem(name: "dates", value: params.dates)
        let queryItemZoneid = URLQueryItem(name: "zoneid", value: params.zoneid)
        parameters?.queryItems = [queryItemDates, queryItemZoneid]
        
        AF.request(parameters?.url ?? "", method: .get, headers: header).validate(statusCode: 200...299).responseDecodable(of: [Workstation].self) { response in
            
            if let workstations = response.value {
//                print(workstations)
                completion(.success(workstations))
            } else {
                completion(.failure(DataSourceError.firstError))
            }
        
        }
    }
    
    func makeWorkstationReservation(parent: String, params: MakeWorkstationReservationUseCaseParams, success: @escaping ((Bool) -> ())) {
        
        let header = getHeader(token: getToken())
        
        var parameters = URLComponents(string: parent)
        let queryItemWorkstationId = URLQueryItem(name: "workstationid", value: params.workstationid)
        let queryItemDates = URLQueryItem(name: "dates", value: params.dates)
        parameters?.queryItems = [queryItemWorkstationId, queryItemDates]
        
        AF.request(parameters?.url ?? "", method: .post, headers: header).validate(statusCode: 200...299).response { response in
            print("\(response.value as Any)")
            if let error = response.error {
                print("\(error) RESERV. WORKSTATION ERROR")
                success(false)
            } else {
                success(true)
            }
        }
    }
    
    
}
