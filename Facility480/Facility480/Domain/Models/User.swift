//
//  User.swift
//  Facility480
//
//  Created by Hector Martin on 19/5/22.
//

import Foundation

public struct User: Codable{
    
    var user_id: String?
    var email: String?
    var name: String?
    var environment: [String:String]?
    
}

struct UserToken: Codable {
    var token: String
    var refresh_token: String
}
