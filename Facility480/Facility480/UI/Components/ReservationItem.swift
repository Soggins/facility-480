//
//  ReservationItem.swift
//  Facility480
//
//  Created by Hector Martin on 27/4/22.
//

import SwiftUI

struct ReservationItem: View {
    var body: some View {
        
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Button {
                    
                } label: {
                ReservationItemImage()
                VStack(alignment: .leading) {
                    Text("Puesto de trabajo 45")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("Lunes 31 may. | 8:00 a 17:30")
                        .font(.footnote)
                }
                
                
                Spacer()
                
                Text("2€")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(width: 40, height: 20)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(.gray.opacity(0.1)))
                    .padding(.bottom, 15)
                
                Spacer()
                }
                .foregroundColor(.black)
                Menu{
                    Button("Cancel", action: cancel)
                } label: {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.black.opacity(0.2))
                    .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.75)
                }
                
                

            }
            
        }
        .frame(height: UIScreen.main.bounds.height * 0.105)
        
    }
    
    func cancel() { }
}

struct ReservationItem_Previews: PreviewProvider {
    static var previews: some View {
        ReservationItem()
    }
}
