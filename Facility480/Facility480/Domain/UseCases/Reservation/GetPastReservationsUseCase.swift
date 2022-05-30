//
//  GetPastReservationsUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 30/5/22.
//

import Foundation

class GetPastReservationUseCase {
    
    let url = "\(baseUrl)reservation"
    var repository : ReservationRepository
    
    init(reservationRepository: ReservationRepository){
        self.repository = reservationRepository
    }
    
    public func execute(completion: @escaping((Result<[Reservation], DataSourceError>)) -> Void){
        
        repository.getPastReservations(parent: url, completion: { result in
            
            switch result {
            case .success(let reservation):
                completion(.success(reservation))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}
