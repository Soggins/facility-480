//
//  GetVehiclesUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

class GetVehiclesUseCase {
    
    let url = "\(baseUrl)vehicles"
    var repository : VehicleRepository
    
    init(vehicleRepository: VehicleRepository){
        self.repository = vehicleRepository
    }
    
    public func execute(params: GetVehiclesUseCaseParams,completion: @escaping((Result<[Vehicle], DataSourceError>)) -> Void){
        
        repository.getVehicles(parent: url, params: params, completion: { result in
            
            switch result {
            case .success(let vehicles):
                completion(.success(vehicles))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}

public struct GetVehiclesUseCaseParams: Codable {
    var dates: String
}
