//
//  MyReservationsTab-Current.swift
//  Facility480
//
//  Created by Hector Martin on 5/5/22.
//

import SwiftUI

struct MyReservationsTab_Current: View {
    @Binding var selectedItem: Reservation?
    
    
//    let reservations : Reservations
    
    @Binding var showDetail: Bool
    
    var body: some View {
        List{
//            VStack(spacing: 5) {
//                ForEach(reservations, id: \.self) { reservation in
//                    ReservationItem(reservation: reservation, selectedItem: $selectedItem, showDetail: $showDetail)
//                }
//            }
        
        }
        .listStyle(.plain)
        .padding(.top, 10)
        
    }
}
//
//struct MyReservationsTab_Current_Previews: PreviewProvider {
//    static var previews: some View {
//        MyReservationsTab_Current(selectedItem: <#Binding<Reservation?>#>, showDetail: <#Binding<Bool>#>)
//    }
//}
