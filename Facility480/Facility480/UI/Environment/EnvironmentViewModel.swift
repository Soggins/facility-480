//
//  EnvironmentViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 11/5/22.
//

import Foundation

class EnvironmentViewModel: ObservableObject {
    @Published var isCompanySelected: Bool = false
    @Published var flowControl: EnvironmentViewsEnum?
    
    public func handleOnUserLogged() {
        flowControl = .home
    }
    
    public func handleOnCompanySelected() {
        flowControl = .login
    }
}
