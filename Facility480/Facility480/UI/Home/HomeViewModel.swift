//
//  HomeView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 25/4/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var flowControl: HomeViewsEnum? = nil
    @Published var repositories = DependencyInjector()
    @Published var toAllReservations: Bool = false
    
    @Published var nextReservation: Reservation?
    @Published var currentReservations: [Reservation]?
    
    let nextReservationUseCase: GetNextReservationUseCase
    let currentReservationsUseCase: GetCurrentReservationsUseCase
    
    
    init(repositories: DependencyInjector.Repositories) {
        self.nextReservationUseCase = GetNextReservationUseCase(reservationRepository: repositories.reservationRepository)
        self.currentReservationsUseCase = GetCurrentReservationsUseCase(reservationRepository: repositories.reservationRepository)
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
    
    
    public func getNextReservation() {
        nextReservationUseCase.execute(completion: { result in
            switch result {
            case .success(let reservation):
//                print(reservation)
                self.nextReservation = reservation
            case .failure(let error):
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
    
    
    
}


