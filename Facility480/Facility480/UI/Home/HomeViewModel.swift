//
//  HomeView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 25/4/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var flowControl: HomeViewsEnum? = nil
    @Published var repositories: DependencyInjector.Repositories
    
    @Published var nextReservation: Reservation?
    @Published var currentReservations: [Reservation]?
    @Published var pastReservations: [Reservation]?
    
    @Published var selectedReservation: Reservation?
    @Published var selectedType: ReservationType = .housing
    
    let nextReservationUseCase: GetNextReservationUseCase
    let currentReservationsUseCase: GetCurrentReservationsUseCase
    let pastReservationsUseCase: GetPastReservationUseCase
    let deleteReservationUseCase: DeleteReservationUseCase
    
//    let onSelectedReservation: ((Reservation) -> Void)?
    
    
    init(repositories: DependencyInjector.Repositories) {
        self.repositories = repositories
        self.nextReservationUseCase = GetNextReservationUseCase(reservationRepository: repositories.reservationRepository)
        self.currentReservationsUseCase = GetCurrentReservationsUseCase(reservationRepository: repositories.reservationRepository)
        self.pastReservationsUseCase = GetPastReservationUseCase(reservationRepository: repositories.reservationRepository)
        self.deleteReservationUseCase = DeleteReservationUseCase(reservationRepository: repositories.reservationRepository)
    }
    
    func handleOnViewAll() {
        flowControl = .myReservations
    }
    
    func handleOnDetails() {
        flowControl = .reservationDetails
    }
    
    func handleOnSettings() {
        flowControl = .settings
    }
    
    func handleOnMakeReservation() {
        flowControl = .makeReservation
    }
    
    public func getNextReservation() {
        nextReservationUseCase.execute(completion: { result in
            switch result {
            case .success(let reservation):
//                print(reservation)
                self.nextReservation = reservation
            case .failure(let error):
                self.nextReservation = nil
                print(error)
            }
        })
    }
    
    public func getCurrentReservations() {
        currentReservationsUseCase.execute(completion: { result in
            switch result {
            case .success(let reservations):
                self.currentReservations = reservations
            case .failure(let error):
                print(error)
            }
        })
    }
    
    public func getPastReservations() {
        pastReservationsUseCase.execute(completion: { result in
            switch result {
            case .success(let reservations):
                self.pastReservations = reservations
            case .failure(let error):
                print(error)
            }
        })
    }
    
    public func deleteReservation(_ reservation: Reservation) {
        
        deleteReservationUseCase.execute(success: { [self] state in
            print("DELETE: \(state)")
            
            if state {
                print("WAS DELETED: \(reservation)")
                
                if currentReservations != nil {
                    if let index = currentReservations!.firstIndex(of: reservation) {
                        currentReservations?.remove(at: index)
                    }
                }

                
            }
        }, id: reservation.reservation_id)
    }
    
    
    
}


