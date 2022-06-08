//
//  GetHousingsUseCase.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

class GetHousingsUseCase {
    
    let url = "\(baseUrl)housing"
    var repository : HousingRepository
    
    init(housingRepository: HousingRepository){
        self.repository = housingRepository
    }
    
    public func execute(params: GetHousingsUseCaseParams,completion: @escaping((Result<[Housing], DataSourceError>)) -> Void){
        
        repository.getHousings(parent: url, params: params, completion: { result in
            
            switch result {
            case .success(let housings):
                completion(.success(housings))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}

public struct GetHousingsUseCaseParams: Codable {
    var dates: String
}
