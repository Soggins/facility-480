//
//  UserLoginUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 23/5/22.
//

import Foundation

class UserLogInUseCase {
    let url = "\(baseUrl)login_check"
    var repository: UserRepository
    
    init(userRepository: UserRepository) {
        self.repository = userRepository
    }
    
    public func execute(user: UserLoginUseCaseParams, success: @escaping ((Bool)) -> ()) {
        return repository.logIn(parent: url, user: user, success: {
            state in
            
            success(state)
        })
    }
}

public struct UserLoginUseCaseParams: Codable {
    var username: String
    var password: String
}
