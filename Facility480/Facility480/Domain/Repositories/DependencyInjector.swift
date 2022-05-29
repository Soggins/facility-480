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
        self.repositories = DependencyInjector.Repositories.init(userRepository: UserRemoteDataSource(), reservationRepository: ReservationDataSource())
    }
}

extension DependencyInjector {
    struct Repositories {

        let reservationRepository: ReservationRepository
        
        let userRepository: UserRepository
        
        init(userRepository: UserRepository, reservationRepository: ReservationRepository) {
            self.userRepository = userRepository
            self.reservationRepository = reservationRepository
        }
    }
}
