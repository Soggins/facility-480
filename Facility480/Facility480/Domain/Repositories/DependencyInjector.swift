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
        self.repositories = DependencyInjector.Repositories.init(userRepository: UserRemoteDataSource())
    }
    
}

extension DependencyInjector {
    struct Repositories {
        //create repo i need
//        let reservesRepository: ReservesRepository
        
        let userRepository: UserRepository
        
        init(userRepository: UserRepository) {
            self.userRepository = userRepository
        }
    }
}
