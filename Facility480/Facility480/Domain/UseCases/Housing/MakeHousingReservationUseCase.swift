//
//  MakeHousingReservationUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

class MakeHousingReservationUseCase {
    let url = "\(baseUrl)reservation/housing"
    var repository : HousingRepository
    
    init(housingRepository: HousingRepository){
        self.repository = housingRepository
    }
    
    public func execute(params: MakeHousingReservationUseCaseParams, success: @escaping ((Bool)) -> ()) {
        return repository.makeHousingReservation(parent: url, params: params, success: {
            state in
            
            success(state)
        })
    }
}

public struct MakeHousingReservationUseCaseParams: Codable {
    var housingid: String
    var dates: String
}
