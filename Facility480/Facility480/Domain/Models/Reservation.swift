//
//  Reservation.swift
//  Facility480
//
//  Created by Hector Martin on 6/5/22.
//

import Foundation

//common reservation data
protocol ReservationTypeCommonData: Codable, Hashable {
    var name: String { get  }
    var available : Bool { get }
}

//reservation data
public protocol ReservationProtocol: Codable, Hashable {
    
    var reservation_id: String { get  }
    var date: String { get  }
    var type: String { get  }
}

public enum ReservationType : Codable {
    case workstation
    case housing
    case vehicle
}

public enum ReservationTypeWithData: Codable, Hashable {
    case workStation(WorkStationData)
    case housing(HousingData)
    case vehicle(VehicleData)
}

public struct WorkStationData: ReservationTypeCommonData{
    var workstation_id: String
    var name: String
    var available: Bool
}

public struct HousingData : ReservationTypeCommonData {
    var housing_id: String
    var name: String
    var available: Bool
    var latitude: String
    var longitude: String
}

public struct VehicleData: ReservationTypeCommonData {
    var licensePlate: String
    var name: String
    var parked_on: String
    var available: Bool
}

struct Reservation: ReservationProtocol {
    var reservation_id: String
    var date: String
    var type: String
    
    var workStation: WorkStationData?
    var housing: HousingData?
    var vehicle: VehicleData?
    
    func getType() -> ReservationType?{
        switch type {
        case "housing":
            return .housing
        case "workstation":
            return .workstation
        case "vehicle":
            return .vehicle
        default:
            return nil
        }
    }
    
    func getData() -> ReservationTypeWithData?{
        switch getType() {
        case .housing:
            return .housing(housing!)
        case .workstation:
            return .workStation(workStation!)
        case .vehicle:
            return .vehicle(vehicle!)
        default:
            return nil
        }
    }
}
