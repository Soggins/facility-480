//
//  LoginView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 20/4/22.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published var email = "hector.martin@cuatroochenta.com"
    @Published var password = "contrasena"
    @Published var recordar: Bool = false
    
    @Published var isLoggedIn: Bool = false
    
    let userLogIn: UserLogInUseCase
    
    let handleOnLogin: (() -> Void)?
    
    init(repositories: DependencyInjector.Repositories, handleOnLogin: (() -> Void)? = nil){
        self.userLogIn = UserLogInUseCase(userRepository: repositories.userRepository)
        self.handleOnLogin = handleOnLogin
    }
    
    func logIn() {
        userLogIn.execute(user: UserLoginUseCaseParams(username: email, password: password), success: { state in
            print(state)
            if state {
                if let handleOnLogin = self.handleOnLogin {
                    handleOnLogin()
                }
            }
            
            self.isLoggedIn = state
            
        })
    }

    
    
}

