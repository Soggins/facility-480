//
//  MyReservationsTab-Current.swift
//  Facility480
//
//  Created by Hector Martin on 5/5/22.
//

import SwiftUI

struct MyReservationsTab_Current: View {
    let reservations : [Reservation] =
    [Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 1),
     Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 2),
     Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 3),
     Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 4),
     Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 5),
     Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 6),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 7),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 8),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 9),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 10),
     Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 11),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 12),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 13),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 14),
      Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 15)
     ]
    
    @State private var showDetail = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 5) {
                ForEach(reservations, id: \.self) { reservation in
                    ReservationItem(reservation: reservation, showDetail: $showDetail)
                }
            }
        
        }
        .padding(.top, 10)
        
    }
}

struct MyReservationsTab_Current_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationsTab_Current()
    }
}
