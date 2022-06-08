//
//  VehicleDataSource.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation
import Alamofire

class VehicleDataSource: VehicleRepository {
    func getVehicles(parent: String, params: GetVehiclesUseCaseParams, completion: @escaping ((Result<[Vehicle], DataSourceError>)) -> Void) {
        let header = getHeader(token: getToken())
        
        var parameters = URLComponents(string: parent)
        let queryItemDates = URLQueryItem(name: "dates", value: params.dates)
        parameters?.queryItems = [queryItemDates]
        
        AF.request(parameters?.url ?? "", method: .get, headers: header).validate(statusCode: 200...299).responseDecodable(of: [Vehicle].self) { response in
            
            if let vehicles = response.value {
//                print(vehicles)
                completion(.success(vehicles))
            } else {
                completion(.failure(DataSourceError.firstError))
            }
        
        }
    }
    
    func makeVehicleReservation(parent: String, params: MakeVehiclesReservationUseCaseParams, success: @escaping ((Bool) -> ())) {
        let header = getHeader(token: getToken())
        
        var parameters = URLComponents(string: parent)
        let queryItemVehicleId = URLQueryItem(name: "vehicleid", value: params.vehicleid)
        let queryItemDates = URLQueryItem(name: "dates", value: params.dates)
        parameters?.queryItems = [queryItemVehicleId, queryItemDates]
        
        AF.request(parameters?.url ?? "", method: .post, headers: header).validate(statusCode: 200...299).response { response in
            print("\(response.value as Any)")
            if let error = response.error {
                print("\(error) RESERV. VEHICLE ERROR")
                success(false)
            } else {
                success(true)
            }
        }
    }
    
    
}
