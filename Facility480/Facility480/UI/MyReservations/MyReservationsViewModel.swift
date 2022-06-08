//
//  MyReservationsView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 2/5/22.
//

import Foundation

class MyReservationsViewModel: ObservableObject {
    @Published var repositories: DependencyInjector.Repositories
    @Published var myReservationsFlowControl: MyReservationsViewsEnum? = nil
    
    @Published var currentReservations: [Reservation]
    @Published var pastReserations: [Reservation]
    
    let deleteReservationUseCase: DeleteReservationUseCase
    
    func handleOnReservationDelete(_ reservation: Reservation) {
        if let index = currentReservations.firstIndex(of: reservation) {
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
    
    public func deleteReservation(_ reservation: Reservation) {
        
        deleteReservationUseCase.execute(success: { [self] state in
            //print("DELETE: \(state)")
            
            if state {
                //print("WAS DELETED: \(reservation)")
                
                if let index = currentReservations.firstIndex(of: reservation) {
                    currentReservations.remove(at: index)
                }

                
            }
        }, id: reservation.reservation_id)
    }
}
