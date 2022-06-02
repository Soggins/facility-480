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
    @Published var pastReserations: [Reservation]
    
    func handleOnReservationDelete(_ reserve: Reservation) {
        if let index = currentReservations.firstIndex(of: reserve) {
            currentReservations.remove(at: index)
        }
    }
    
    
    init(currentReservations: [Reservation], pastReservations: [Reservation]) {
        self.currentReservations = currentReservations
        self.pastReserations = pastReservations
    }
    
    func toDetails(){
        myReservationsFlowControl = .reservationDetails
    }
}
