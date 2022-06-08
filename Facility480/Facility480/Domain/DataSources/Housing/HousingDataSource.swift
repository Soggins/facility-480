//
//  HousingDataSource.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation
import Alamofire

class HousingDataSource: HousingRepository {
    func getHousings(parent: String, params: GetHousingsUseCaseParams, completion: @escaping ((Result<[Housing], DataSourceError>)) -> Void) {
        let header = getHeader(token: getToken())
        
        var parameters = URLComponents(string: parent)
        let queryItemDates = URLQueryItem(name: "dates", value: params.dates)
        parameters?.queryItems = [queryItemDates]
        
        AF.request(parameters?.url ?? "", method: .get, headers: header).validate(statusCode: 200...299).responseDecodable(of: [Housing].self) { response in
            
            if let housings = response.value {
//                print(housings)
                completion(.success(housings))
            } else {
                completion(.failure(DataSourceError.firstError))
            }
        
        }
    }
    
    func makeHousingReservation(parent: String, params: MakeHousingReservationUseCaseParams, success: @escaping ((Bool) -> ())) {
        let header = getHeader(token: getToken())
        
        var parameters = URLComponents(string: parent)
        let queryItemHousingId = URLQueryItem(name: "housingid", value: params.housingid)
        let queryItemDates = URLQueryItem(name: "dates", value: params.dates)
        parameters?.queryItems = [queryItemHousingId, queryItemDates]
        
        AF.request(parameters?.url ?? "", method: .post, headers: header).validate(statusCode: 200...299).response { response in
            print("\(response.value as Any)")
            if let error = response.error {
                print("\(error) RESERV. HOUSING ERROR")
                success(false)
            } else {
                success(true)
            }
        }
    }
    
    
}
