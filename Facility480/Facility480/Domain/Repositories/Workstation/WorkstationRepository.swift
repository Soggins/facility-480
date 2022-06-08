//
//  WorkstationRepository.swift
//  Facility480
//
//  Created by Hector Martin on 7/6/22.
//

import Foundation

protocol WorkstationRepository {

    func getWorkstations(
        parent: String,
        params: GetWorkstationsUseCaseParams,
        completion: @escaping((Result<[Workstation], DataSourceError>)) -> Void
    )
    
    func makeWorkstationReservation(
        parent: String,
        params: MakeWorkstationReservationUseCaseParams,
        success: @escaping ((Bool) -> ())
    )
    
}
