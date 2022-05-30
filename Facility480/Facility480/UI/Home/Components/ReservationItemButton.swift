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
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(width: 72, height: 72)
                    .foregroundColor(.green)
                
                Image("\(facilityName)icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 33, height: 33)
                    
            }
            
            Text(facilityName.capitalized)
                .foregroundColor(.white)
        }
    }
}

struct ReservationItemButton_Previews: PreviewProvider {
    static var previews: some View {
        ReservationItemButton(facilityName: "Vehicle")
    }
}
