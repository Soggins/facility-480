//
//  VehicleRepository.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

protocol VehicleRepository {

    func getVehicles(parent: String, params: GetVehiclesUseCaseParams, completion: @escaping((Result<[Vehicle], DataSourceError>)) -> Void)
    func makeVehicleReservation(parent: String, params: MakeVehiclesReservationUseCaseParams, success: @escaping ((Bool) -> ()))
    
}
