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
    @Published var selectedWorkstation: Workstation?
    
    var selectedDateAsString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: self.selectedDate)
    }
    
    @Published var zones: [Zone] = []
    @Published var workstations: [Workstation] = []
    
    let getZonesUseCase: GetZonesUseCase
    let getWorkstationsUseCase: GetWorkstationsUseCase
    let makeWorkstationReservationUseCase: MakeWorkstationReservationUseCase
    
    
    
    init(selectedType: ReservationType, repositories: DependencyInjector.Repositories){
        self.selectedType = selectedType
        self.repositories = repositories
        self.getZonesUseCase = GetZonesUseCase(zoneRepository: repositories.zoneRepository)
        self.getWorkstationsUseCase = GetWorkstationsUseCase(workstationRepository: repositories.workstationRepository)
        self.makeWorkstationReservationUseCase = MakeWorkstationReservationUseCase(workstationRepository: repositories.workstationRepository)
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
    
    public func getWorkstations() {
        getWorkstationsUseCase.execute(params: GetWorkstationUseCaseParams(date: selectedDateAsString, zoneid: selectedZone?.zone_id ?? ""), completion: { result in
            switch result {
            case .success(let workstations):
                self.workstations = workstations
            case .failure(let error):
                print(error)
            }
        })
    }
    
    public func makeWorkstationReservation() {
        makeWorkstationReservationUseCase.execute(params: MakeWorkstationReservationUseCaseParams(workstationid: selectedWorkstation?.workstation_id ?? "", dates: selectedDateAsString), success: { result in
            if result {
                
            } else {
                
            }
        })
    }

}
