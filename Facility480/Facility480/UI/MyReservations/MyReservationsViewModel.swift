//
//  MyReservationsView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 2/5/22.
//

import Foundation

class MyReservationsViewModel: ObservableObject {
    @Published var repositories: DependencyInjector.Repositories
    @Published var flowControl: HomeViewsEnum? = nil
    @Published var myReservationsFlowControl: MyReservationsViewsEnum? = nil
    
    @Published var currentReservations: [Reservation]
    @Published var pastReserations: [Reservation]
    
    let deleteReservationUseCase: DeleteReservationUseCase
    
    func handleOnReservationDelete(_ reserve: Reservation) {
        if let index = currentReservations.firstIndex(of: reserve) {
            currentReservations.remove(at: index)
        }
    }
    
    
    init(currentReservations: [Reservation], pastReservations: [Reservation], repositories: DependencyInjector.Repositories) {
        self.repositories = repositories
        self.currentReservations = currentReservations
        self.pastReserations = pastReservations
        self.deleteReservationUseCase = DeleteReservationUseCase(reservationRepository: repositories.reservationRepository)
    }
    
    func toDetails(){
        myReservationsFlowControl = .reservationDetails
    }
}
