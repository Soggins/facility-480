//
//  DependencyInjector.swift
//  Facility480
//
//  Created by Hector Martin on 23/5/22.
//

import Foundation

struct DependencyInjector {
    
    let repositories: DependencyInjector.Repositories
    
    init() {
        self.repositories = DependencyInjector.Repositories.init(userRepository: UserRemoteDataSource(), reservationRepository: ReservationDataSource(), zoneRepository: ZoneDataSource(), workstationRepository: WorkstationDataSource(), vehicleRepository: VehicleDataSource(), housingRepository: HousingDataSource())
    }
}

extension DependencyInjector {
    struct Repositories {
        let zoneRepository: ZoneRepository
        let workstationRepository: WorkstationRepository
        let vehicleRepository: VehicleRepository
        let housingRepository: HousingRepository

        let reservationRepository: ReservationRepository
        
        let userRepository: UserRepository
        
        init(userRepository: UserRepository, reservationRepository: ReservationRepository, zoneRepository: ZoneRepository, workstationRepository: WorkstationRepository, vehicleRepository: VehicleRepository, housingRepository: HousingRepository) {
            self.userRepository = userRepository
            self.reservationRepository = reservationRepository
            self.zoneRepository = zoneRepository
            self.workstationRepository = workstationRepository
            self.vehicleRepository = vehicleRepository
            self.housingRepository = housingRepository
        }
    }
}
