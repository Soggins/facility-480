//
//  DeleteReservationUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 27/5/22.
//

import Foundation

class DeleteReservationUseCase {
    
    let url = "\(baseUrl)reservation"
    var repository : ReservationRepository
    
    init(reservationRepository: ReservationRepository){
        self.repository = reservationRepository
    }
    
    public func execute(success: @escaping((Bool)) -> (), id: String){
        
        repository.deleteReservation(parent: url, id: id, success: { state in
            success(state)
        })
    }
}
