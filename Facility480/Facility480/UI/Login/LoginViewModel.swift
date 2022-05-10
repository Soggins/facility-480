//
//  LoginView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 20/4/22.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var pass = ""
    @Published var recordar: Bool = false
    
    @Published var isLoggedIn: Bool = false
}

