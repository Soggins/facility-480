//
//  MyReservationTab-Current.swift
//  Facility480
//
//  Created by Hector Martin on 5/5/22.
//

import SwiftUI

struct MyReservationTab_Current: View {
    var body: some View {
        List {
            ReservationItem()
            ReservationItem()
            ReservationItem()
            ReservationItem()
        }
    }
}

struct MyReservationTab_Current_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationTab_Current()
    }
}
