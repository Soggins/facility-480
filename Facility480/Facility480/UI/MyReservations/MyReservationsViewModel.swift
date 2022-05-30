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
    @Published var myReservationsFlowControl: MyReservationsViewsEnum? = nil
    
    @Published var currentReservations: [Reservation]
    
    
    init(currentReservations: [Reservation]) {
        self.currentReservations = currentReservations
    }
    
    func toDetails(){
        myReservationsFlowControl = .reservationDetails
    }
}
