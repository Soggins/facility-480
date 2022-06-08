//
//  GetZonesUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 7/6/22.
//

import Foundation

class GetZonesUseCase {
    
    let url = "\(baseUrl)zone"
    var repository : ZoneRepository
    
    init(zoneRepository: ZoneRepository){
        self.repository = zoneRepository
    }
    
    public func execute(completion: @escaping((Result<[Zone], DataSourceError>)) -> Void){
        
        repository.getZones(parent: url, completion: { result in
            
            switch result {
            case .success(let zones):
                completion(.success(zones))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}
