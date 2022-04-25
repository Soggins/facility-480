//
//  LoginView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 20/4/22.
//

import Foundation

extension LoginView {
    @MainActor class ViewModel: ObservableObject {
        @Published var email = ""
        @Published var pass = ""
        @Published var recordar: Bool = false
    }
}
