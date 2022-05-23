//
//  UserRemoteDataSource.swift
//  Facility480
//
//  Created by Hector Martin on 23/5/22.
//

import Foundation
import Alamofire
import SwiftUI


public enum DataSourceError: Error {
    case firstError
}

class UserRemoteDataSource: UserRepository {
    func getUserInfo(parent: String, completion: @escaping ((Result<User, DataSourceError>)) -> Void) {
        
    }
    
    func logIn(parent: String, user: UserLoginUseCaseParams, success: @escaping ((Bool) -> ())) {
        
        AF.request(parent, method: .post, parameters: user, encoder: JSONParameterEncoder()).validate(statusCode: 200...299).responseDecodable(of: UserToken.self) { response in
            
            if let error = response.error {
                print(error)
                success(false)
            } else {
                UserDefaults.standard.set(response.value?.token, forKey: "token")
                UserDefaults.standard.set(response.value?.refresh_token, forKey: "refreshToken")
                success(true)
            }
        }
    }
    
    
}
