//
//  NextReservationButton.swift
//  Facility480
//
//  Created by Hector Martin on 29/5/22.
//

import SwiftUI

struct NextReservationButton: View {
    var body: some View {
        Button {
            selectedReservation = viewModel.nextReservation!
            viewModel.handleOnDetails()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .foregroundColor(.gray.opacity(0.2))
                
                VStack{
                    HStack {
                        VStack {
                            Text("Próxima reserva en 0d 3h 29m")
                                .fontWeight(.bold)
                            Text("\(viewModel.nextReservation?.date ?? "null") \(viewModel.nextReservation?.reservation_id ?? "null")")
                        }
                        .foregroundColor(.black)
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundColor(.black)
                            Image(systemName: "arrow.right")
                                .foregroundColor(.green)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.09, height: UIScreen.main.bounds.height * 0.05)
                    }
                    
                    ProgressView(value: 75, total: 100)
                            .accentColor(Color.green)
                            .scaleEffect(x: 1, y: 1.25, anchor: .center)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.915, height: UIScreen.main.bounds.height * 0.101)
        }
    }
}

//struct NextReservationButton_Previews: PreviewProvider {
//    static var previews: some View {
//        NextReservationButton()
//    }
//}
