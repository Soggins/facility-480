//
//  MakeReservationViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 2/6/22.
//

import Foundation

class MakeReservationViewModel: ObservableObject {
    @Published var selectedType: ReservationType
    @Published var repositories: DependencyInjector.Repositories
    
    @Published var selectedDate = Date()
    @Published var selectedZone: Zone?
    @Published var selectedItem: ReservationCommonItem?
    
    var selectedDateAsString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: self.selectedDate)
    }
    
    @Published var zones: [Zone] = []
    @Published var reservationItems: [ReservationCommonItem] = []
    
    let getZonesUseCase: GetZonesUseCase
    let getWorkstationsUseCase: GetWorkstationsUseCase
    let makeWorkstationReservationUseCase: MakeWorkstationReservationUseCase
    let getVehiclesUseCase: GetVehiclesUseCase
    let makeVehiclesReservationUseCase: MakeVehiclesReservationUseCase
    let getHousingsUseCase: GetHousingsUseCase
    let makeHousingReservationUseCase: MakeHousingReservationUseCase

    init(selectedType: ReservationType, repositories: DependencyInjector.Repositories){
        self.selectedType = selectedType
        self.repositories = repositories
        self.getZonesUseCase = GetZonesUseCase(zoneRepository: repositories.zoneRepository)
        self.getWorkstationsUseCase = GetWorkstationsUseCase(workstationRepository: repositories.workstationRepository)
        self.makeWorkstationReservationUseCase = MakeWorkstationReservationUseCase(workstationRepository: repositories.workstationRepository)
        self.getVehiclesUseCase = GetVehiclesUseCase(vehicleRepository: repositories.vehicleRepository)
        self.makeVehiclesReservationUseCase = MakeVehiclesReservationUseCase(vehicleRepository: repositories.vehicleRepository)
        self.getHousingsUseCase = GetHousingsUseCase(housingRepository: repositories.housingRepository)
        self.makeHousingReservationUseCase = MakeHousingReservationUseCase(housingRepository: repositories.housingRepository)
        
        if selectedType == .workstation {
            getZones()
        }
    }
    
    public func getZones() {
        getZonesUseCase.execute(completion: { result in
            switch result {
            case .success(let zones):
                self.zones = zones
            case .failure(let error):
                print(error)
            }
            
        })
    }
    
    public func getItems() {
        reservationItems = []
        switch selectedType {
        case .workstation:
            getWorkstations()
        case .housing:
            getHousing()
        case .vehicle:
            getVehicles()
        }
    }
    
    public func makeReservation() {
        switch selectedType {
        case .workstation:
            makeWorkstationReservation()
        case .housing:
            makeHousingReservation()
        case .vehicle:
            makeVehiclesReservation()
        }
    }
    
    public func getWorkstations() {
        getWorkstationsUseCase.execute(params: GetWorkstationsUseCaseParams(dates: selectedDateAsString, zoneid: selectedZone?.zone_id ?? ""), completion: { result in
            switch result {
            case .success(let workstations):
                self.reservationItems.append(contentsOf: workstations.map({ workstation in
                    ReservationCommonItem(id: workstation.workstation_id, name: workstation.name, available: workstation.available)
                }))
            case .failure(let error):
                print(error)
            }
        })
    }
    
    public func makeWorkstationReservation() {
        makeWorkstationReservationUseCase.execute(params: MakeWorkstationReservationUseCaseParams(workstationid: selectedItem?.id ?? "", dates: selectedDateAsString), success: { result in
            if result {
                
            } else {
                
            }
        })
    }
    
    public func getVehicles() {
        getVehiclesUseCase.execute(params: GetVehiclesUseCaseParams(dates: selectedDateAsString), completion: { result in
            switch result {
            case .success(let vehicles):
                self.reservationItems.append(contentsOf: vehicles.map({ vehicle in
                    ReservationCommonItem(id: vehicle.licensePlate, name: vehicle.name, available: vehicle.available)
                }))
            case .failure(let error):
                print(error)
            }
        })
    }
    
    public func makeVehiclesReservation() {
        makeVehiclesReservationUseCase.execute(params: MakeVehiclesReservationUseCaseParams(vehicleid: selectedItem?.id ?? "", dates: selectedDateAsString), success: { result in
            if result {
                
            } else {
                
            }
        })
    }
    
    public func getHousing() {
        getHousingsUseCase.execute(params: GetHousingsUseCaseParams(dates: selectedDateAsString), completion: { result in
            switch result {
            case .success(let housings):
                self.reservationItems.append(contentsOf: housings.map({ housing in
                    ReservationCommonItem(id: housing.housing_id, name: housing.name, available: housing.available)
                }))
            case .failure(let error):
                print(error)
            }
        })
    }
    
    public func makeHousingReservation() {
        makeHousingReservationUseCase.execute(params: MakeHousingReservationUseCaseParams(housingid: selectedItem?.id ?? "", dates: selectedDateAsString), success: { result in
            if result {
                
            } else {
                
            }
        })
    }
    
    
}
