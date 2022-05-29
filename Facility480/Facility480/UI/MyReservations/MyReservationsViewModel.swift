//
//  MyReservationsView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 2/5/22.
//

import Foundation

class MyReservationsViewModel: ObservableObject {
    @Published var repositories = DependencyInjector()
    @Published var flowControl: HomeViewsEnum? = nil
    
    
    
    let handleOnDetails: (() -> Void)?
    
    init(handleOnDetails: (() -> Void)? = nil) {
        self.handleOnDetails = handleOnDetails
    }
    
    func toDetails(){
        if let handleOnDetails = handleOnDetails {
            handleOnDetails()
        }
    }
}
