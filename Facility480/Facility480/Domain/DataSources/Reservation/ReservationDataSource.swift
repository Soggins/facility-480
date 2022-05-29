//
//  ReservationDataSource.swift
//  Facility480
//
//  Created by Hector Martin on 26/5/22.
//

import Foundation
import Alamofire

class ReservationDataSource: ReservationRepository {
    func listPastReservations(parent: String, completion: @escaping ((Result<[Reservation], DataSourceError>)) -> Void) {
        
    }
    
    func getCurrentReservations(parent: String, completion: @escaping ((Result<[Reservation], DataSourceError>)) -> Void) {
        let header = getHeader(token: getToken())
        
        
        AF.request(parent, method: .get, headers: header).validate(statusCode: 200...299).responseDecodable(of: [Reservation].self) { response in
            
            if let listReservations = response.value {
                print(listReservations)
                completion(.success(listReservations))
            } else {
                completion(.failure(DataSourceError.firstError))
            }
        
        }
    }
    
    func getNextReservation(parent: String, completion: @escaping ((Result<Reservation, DataSourceError>)) -> Void) {
        let header = getHeader(token: getToken())
        
        AF.request(parent, method: .get, headers: header).validate(statusCode: 200...299).responseDecodable(of: Reservation.self) { response in
            print("NEXT RESERVATION: \(response.value as Any)")
            
            if let nextReservationInfo = response.value {
                completion(.success(nextReservationInfo))
            } else {
                completion(.failure(DataSourceError.firstError))
            }
        }
    }
    
    func deleteReservation(parent: String, id: String, success: @escaping ((Bool) -> ())) {
        
        let header = getHeader(token: getToken())
        
        AF.request(parent, method: .delete, parameters: id, headers: header).validate(statusCode: 200...299).response { response in
            print("\(response.value as Any) delete response")
            print("DELETE URL: \(response.request)")
            if let error = response.error {
                print("\(error) DELETE ERROR")
                success(false)
            } else {
                success(true)
            }
        }
    }
    
    
    
    
}