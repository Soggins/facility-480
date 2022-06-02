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

public enum ReservationType : Codable, CaseIterable {
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
            return .housing(housing ?? HousingData(housing_id: "not found", name: "error", available: false, latitude: "", longitude: ""))
        case .workstation:
            return .workStation(workStation ?? WorkStationData(workstation_id: "not found", name: "error", available: false))
        case .vehicle:
            return .vehicle(vehicle ?? VehicleData(licensePlate: "not found", name: "error", parked_on: "error", available: false))
        default:
            return nil
        }
    }
    
    func getName() -> String {
        switch getData() {
        case .workStation(let workStationData):
            return workStationData.name
        case .housing(let housingData):
            return housingData.name
        case .vehicle(let vehicleData):
            return vehicleData.name
        case .none:
            return ""
        }
    }
    
    func getIcon() -> String{
        switch getData() {
        case .workStation:
            return "workstationicon"
        case .housing:
            return "housingicon"
        case .vehicle:
            return "vehicleicon"
        case .none:
            return ""
        }
    }
}
