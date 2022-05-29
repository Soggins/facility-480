//
//  ReservationRepository.swift
//  Facility480
//
//  Created by Hector Martin on 26/5/22.
//

import Foundation

protocol ReservationRepository {
    
    func listPastReservations(parent: String, completion: @escaping((Result<[Reservation], DataSourceError>)) -> Void)
    func getCurrentReservations(parent: String, completion: @escaping((Result<[Reservation], DataSourceError>)) -> Void)
    func getNextReservation(parent: String, completion: @escaping((Result<Reservation, DataSourceError>)) -> Void)
    func deleteReservation(parent: String, id: String, success: @escaping ((Bool) -> ()))
    
}
