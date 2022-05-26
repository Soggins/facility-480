//
//  Reservation.swift
//  Facility480
//
//  Created by Hector Martin on 6/5/22.
//

import Foundation



struct Reservation: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let time: String
    let price: Int
}
