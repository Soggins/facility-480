//
//  ReservationItemButton.swift
//  Facility480
//
//  Created by Hector Martin on 5/5/22.
//

import SwiftUI

struct ReservationItemButton: View {
    var facilityName: String
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .frame(width: 72, height: 72)
                        .foregroundColor(.green)
                    
                    Image("vehicleicon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33, height: 33)
                        
                }
                
                Text(facilityName)
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct ReservationItemButton_Previews: PreviewProvider {
    static var previews: some View {
        ReservationItemButton(facilityName: "Vehicle")
    }
}
