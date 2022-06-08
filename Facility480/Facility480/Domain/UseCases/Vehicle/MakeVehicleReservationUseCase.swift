//
//  MakeVehicleReservationUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

class MakeVehiclesReservationUseCase {
    let url = "\(baseUrl)reservation/vehicle"
    var repository : VehicleRepository
    
    init(vehicleRepository: VehicleRepository){
        self.repository = vehicleRepository
    }
    
    public func execute(params: MakeVehiclesReservationUseCaseParams, success: @escaping ((Bool)) -> ()) {
        return repository.makeVehicleReservation(parent: url, params: params, success: {
            state in
            
            success(state)
        })
    }
}

public struct MakeVehiclesReservationUseCaseParams: Codable {
    var vehicleid: String
    var dates: String
}
