//
//  UserRepository.swift
//  Facility480
//
//  Created by Hector Martin on 23/5/22.
//

import Foundation

public protocol UserRepository {
    
    func getUserInfo(parent: String, completion: @escaping((Result<User, DataSourceError>)) -> Void)
    func logIn(parent: String, user: UserLoginUseCaseParams, success: @escaping ((Bool) -> ()))
//    func refreshToken(parent: String, refreshToken: String)
}
