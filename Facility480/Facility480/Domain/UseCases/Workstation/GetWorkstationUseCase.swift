//
//  GetWorkstationUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 7/6/22.
//

import Foundation

class GetWorkstationsUseCase {
    
    let url = "\(baseUrl)workstation"
    var repository : WorkstationRepository
    
    init(workstationRepository: WorkstationRepository){
        self.repository = workstationRepository
    }
    
    public func execute(params: GetWorkstationUseCaseParams,completion: @escaping((Result<[Workstation], DataSourceError>)) -> Void){
        
        repository.getWorkstations(parent: url, params: params, completion: { result in
            
            switch result {
            case .success(let workstations):
                completion(.success(workstations))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}

public struct GetWorkstationUseCaseParams: Codable {
    var date: String
    var zoneid: String
}
