//
//  ReservationItem.swift
//  Facility480
//
//  Created by Hector Martin on 27/4/22.
//

import SwiftUI

struct ReservationItem: View {
    var reservation: Reservation
    @Binding var selectedReservation: Reservation?

    var body: some View {
        
        HStack(alignment: .center) {
            
            Button {
                selectedReservation = reservation

            } label: {
                HStack {
                    ReservationItemIcon(icon: reservation.getIcon())
                    VStack(alignment: .leading) {
                        Text(reservation.getName())
                            .font(.callout)
                            .fontWeight(.semibold)
                        Text(reservation.date.replacingOccurrences(of: ".", with: "/"))
                            .font(.footnote)
                    }
                    
                    
                        Spacer()
                        
                }
            }
            .foregroundColor(.black)
            .frame(width: 290)
            
            
            Menu{
                Button("Cancel", action: cancel)
            } label: {
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))
                .foregroundColor(.black.opacity(0.2))
                .frame(width: 30, height: 30)
            }
        }
        .frame(height: 60)
//        .onTapGesture {
//            print(selectedItem)
//            showDetail = true
//        }
        
    }
    
    func cancel() { }
}

//struct ReservationItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationItem(reservation: Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 2), showDetail: .constant(false))
//    }
//}
