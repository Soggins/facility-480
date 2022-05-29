//
//  ReservationItemImage.swift
//  Facility480
//
//  Created by Hector Martin on 27/4/22.
//

import SwiftUI

struct ReservationItemIcon: View {
    
    let icon: String
    
    var body: some View{
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 52, height: 52)
                    .foregroundColor(.gray)
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    
            }
            
            
        }
    }
}

//struct ReservationItemImage_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationItemImage()
//    }
//}
