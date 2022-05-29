//
//  GetNextReservationUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 26/5/22.
//

import Foundation

class GetNextReservationUseCase {
    
    let url = "\(baseUrl)reservation/next"
    var repository : ReservationRepository
    
    init(reservationRepository: ReservationRepository){
        self.repository = reservationRepository
    }
    
    public func execute(completion: @escaping((Result<Reservation, DataSourceError>)) -> Void){
        
        repository.getNextReservation(parent: url, completion: { result in
            
            switch result {
            case .success(let reservation):
                completion(.success(reservation))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}
