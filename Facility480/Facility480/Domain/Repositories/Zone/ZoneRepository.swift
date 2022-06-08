//
//  ZoneRepository.swift
//  Facility480
//
//  Created by Hector Martin on 7/6/22.
//

import Foundation

protocol ZoneRepository {

    func getZones(parent: String, completion: @escaping((Result<[Zone], DataSourceError>)) -> Void)
    
}
