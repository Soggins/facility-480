//
//  MyReservationsTab-History.swift
//  Facility480
//
//  Created by Hector Martin on 5/5/22.
//

import SwiftUI

struct MyReservationsTab_History: View {
    @StateObject var viewModel: MyReservationsViewModel
    
    @Binding var selectedReservation: Reservation?
    
    let reservations : [Reservation]

    
    var body: some View {
        List {
            ForEach(reservations, id: \.self) { reservationlist in
                Button {
                    
                } label: {
                    ReservationItem(reservation: reservationlist, selectedReservation: $selectedReservation)
                    
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
        .onChange(of: selectedReservation, perform: { reservation in
            if let _ = reservation {
                viewModel.toDetails()
            }
        })
        .listStyle(PlainListStyle())
        
    }
}

//struct MyReservationsTab_History_Previews: PreviewProvider {
//    static var previews: some View {
//        MyReservationsTab_History()
//    }
//}
