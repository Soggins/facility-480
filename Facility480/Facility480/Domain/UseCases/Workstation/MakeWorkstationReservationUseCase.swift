//
//  MakeWorkstationReservationUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

class MakeWorkstationReservationUseCase {
    let url = "\(baseUrl)reservation/workstation"
    var repository: WorkstationRepository
    
    init(workstationRepository: WorkstationRepository) {
        self.repository = workstationRepository
    }
    
    public func execute(params: MakeWorkstationReservationUseCaseParams, success: @escaping ((Bool)) -> ()) {
        return repository.makeWorkstationReservation(parent: url, params: params, success: {
            state in
            
            success(state)
        })
    }
}

public struct MakeWorkstationReservationUseCaseParams: Codable {
    var workstationid: String
    var dates: String
}
