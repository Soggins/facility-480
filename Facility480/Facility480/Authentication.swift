//
//  Authentication.swift
//  Facility480
//
//  Created by Hector Martin on 23/5/22.
//

import Foundation
import Alamofire

let baseUrl: String = "https://interactive480.herokuapp.com/api/"

let companies: [String] = ["480"]

func getToken() -> String {
    if let token = UserDefaults.standard.object(forKey: "token") as? String {
        return token
    }
    
    return "token doesn't exist"
}

func getHeader(token: String) -> HTTPHeaders {
    [
        "Authorization": "Bearer \(getToken())",
        "Accept": "application/json"
    ]
}
