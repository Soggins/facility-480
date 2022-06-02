//
//  ReservationDetailsViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 26/5/22.
//

import Foundation

class ReservationDetailsViewModel: ObservableObject {
    
    @Published var repositories = DependencyInjector()
    @Published var reservation: Reservation?
    
    let deleteReservationUseCase: DeleteReservationUseCase
    
    let onDismiss: (() -> Void)?
    let onReservationDelete: ((Reservation) -> Void)?
    
    
    init(reservation: Reservation, repositories: DependencyInjector.Repositories, onDismiss: (() -> Void)?,
         onReservationDelete: ((Reservation) -> Void)? = nil
    ) {
        self.reservation = reservation
        self.deleteReservationUseCase = DeleteReservationUseCase(reservationRepository: repositories.reservationRepository)
        self.onDismiss = onDismiss
        self.onReservationDelete = onReservationDelete
    }
    
    func onDismissView() {
        if let onDismiss = onDismiss {
            onDismiss()
        }
    }
    
    
    
    public func deleteReservation() {
        
        deleteReservationUseCase.execute(success: { state in
            print("DELETE: \(state)")
            
            if state {
                print("WAS DELETED: \(self.reservation?.reservation_id ?? "null")")
                if let onReservationDelete = self.onReservationDelete {
                    onReservationDelete(self.reservation!)
                }
                
            }
        }, id: reservation?.reservation_id ?? "")
    }
    
    
}
