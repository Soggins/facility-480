//
//  ZoneDataSource.swift
//  Facility480
//
//  Created by Hector Martin on 7/6/22.
//

import Foundation
import Alamofire

class ZoneDataSource: ZoneRepository {
    func getZones(parent: String, completion: @escaping ((Result<[Zone], DataSourceError>)) -> Void) {
        let header = getHeader(token: getToken())
        
        
        AF.request(parent, method: .get, headers: header).validate(statusCode: 200...299).responseDecodable(of: [Zone].self) { response in
            
            if let zones = response.value {
//                print(zones)
                completion(.success(zones))
            } else {
                completion(.failure(DataSourceError.firstError))
            }
        
        }
    }
    
    
}
