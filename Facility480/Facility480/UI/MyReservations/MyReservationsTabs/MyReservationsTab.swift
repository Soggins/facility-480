//
//  MyReservationsTab-Current.swift
//  Facility480
//
//  Created by Hector Martin on 5/5/22.
//

import SwiftUI

struct MyReservationsTab: View {
    @StateObject var viewModel: MyReservationsViewModel
    
    @Binding var selectedReservation: Reservation?
    
    let reservations : [Reservation]

    
    var body: some View {
        List {
            ForEach(reservations, id: \.self) { reservation in
                Button {
                    
                } label: {
                    ReservationItem(reservation: reservation, selectedReservation: $selectedReservation, action: {
                        viewModel.deleteReservation(reservation)
                    })
                    
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
//
//struct MyReservationsTab_Current_Previews: PreviewProvider {
//    static var previews: some View {
//        MyReservationsTab_Current(selectedItem: <#Binding<Reservation?>#>, showDetail: <#Binding<Bool>#>)
//    }
//}
