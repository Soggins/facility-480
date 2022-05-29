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
    @Binding var showDetail: Bool
    
    var icon: String{
        switch reservation.getData() {
        case .workStation:
            return "workspaceicon"
        case .housing:
            return "housingicon"
        case .vehicle:
            return "vehicleicon"
        case .none:
            return ""
        }
    }
    var name: String {
        switch reservation.getData() {
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

    var body: some View {
        
        HStack(alignment: .center) {
            
            Button {
                selectedReservation = reservation
                showDetail = true
//                print(reservation.price)

            } label: {
                HStack {
                    ReservationItemIcon(icon: icon)
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.callout)
                            .fontWeight(.semibold)
                        Text(reservation.date)
                            .font(.footnote)
                    }
                    
                    Text("5€")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(width: 40, height: 20)
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(.gray.opacity(0.1)))
                        .padding(.bottom, 15)
                    
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
            .background(Color.red)
        }
//        .frame(height: UIScreen.main.bounds.height * 0.105)
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
