//
//  ReservationDetailsView.swift
//  Facility480
//
//  Created by Hector Martin on 5/5/22.
//

import SwiftUI

struct ReservationDetailsView: View {
    let reservation: Reservation
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ZStack {
                    Image("reservationdetailsbg")
                }
                
                Group {
                    Text(reservation.name)
                        .font(.title)
                        .padding(.top, 20)
                        .padding(.bottom, 50)
                    
                    Group{
                        Text("Details of your reservation:")
                            .fontWeight(.medium)
                        Text(reservation.name)
                            .fontWeight(.medium)
                            .foregroundColor(.black.opacity(0.5))
                        Text(reservation.time)
                            .fontWeight(.light)
                    }
                    .padding(.bottom, 2.5)
                }
                .padding(.leading, 25)
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: { self.mode.wrappedValue.dismiss() }) {
                        Image(systemName: "arrow.left")
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .background(.white)
                            .clipShape(Circle())
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu{
                        Button("Cancel", action: { })
                    } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        .background(.white)
                        .clipShape(Circle())
                    }
                }
            }
        }
    }
}

struct ReservationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsView(reservation: Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 2))
    }
}
