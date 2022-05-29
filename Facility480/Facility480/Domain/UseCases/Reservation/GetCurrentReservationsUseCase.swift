//
//  File.swift
//  Facility480
//
//  Created by Hector Martin on 29/5/22.
//

import Foundation

class GetCurrentReservationsUseCase {
    
    let url = "\(baseUrl)reservation/from-now"
    var repository : ReservationRepository
    
    init(reservationRepository: ReservationRepository){
        self.repository = reservationRepository
    }
    
    public func execute(completion: @escaping((Result<[Reservation], DataSourceError>)) -> Void){
        
        repository.getCurrentReservations(parent: url, completion: { result in
            
            switch result {
            case .success(let reservation):
                completion(.success(reservation))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}
