//
//  Vehicle.swift
//  Facility480
//
//  Created by Hector Martin on 8/6/22.
//

import Foundation

public struct Vehicle: ReservationTypeCommonData {
    var licensePlate: String
    var name: String
    var parked_on: String
    var available: Bool
}
