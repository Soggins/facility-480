//
//  ReservationItemImage.swift
//  Facility480
//
//  Created by Hector Martin on 27/4/22.
//

import SwiftUI

struct ReservationItemImage: View {
    var facilityName: String?
    
    var body: some View{
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
            
            if let facilityName = facilityName {
                Text(facilityName)
                    .foregroundColor(.white)
            }
            
        }
    }
}

struct ReservationItemImage_Previews: PreviewProvider {
    static var previews: some View {
        ReservationItemImage()
    }
}
