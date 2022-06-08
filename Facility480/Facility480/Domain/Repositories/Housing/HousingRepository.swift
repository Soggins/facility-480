//
//  HousingRepository.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

protocol HousingRepository {

    func getHousings(parent: String, params: GetHousingsUseCaseParams, completion: @escaping((Result<[Housing], DataSourceError>)) -> Void)
    func makeHousingReservation(parent: String, params: MakeHousingReservationUseCaseParams, success: @escaping ((Bool) -> ()))
    
}
