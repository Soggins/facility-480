//
//  CompanyPopUp.swift
//  Facility480
//
//  Created by Hector Martin on 10/5/22.
//

import SwiftUI

struct CompanyView: View {
    @StateObject var viewModel: CompanyViewModel
    
    @State var companyCode = ""
    @Binding var show: Bool
    
    
    var body: some View {
        ZStack{
            Color.white.opacity(0.1)
            VStack {
                Text("Escribe el código de tu empresa")
                    .fontWeight(.medium)
                    .padding(.top, 30)
                
                TextField("Company code", text: $companyCode)
                    .frame(width: 295, height: 22)
                
                Spacer()
                
                Rectangle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(height: 1)
                HStack{
                    Button(action: {
                        withAnimation{
                            show = false
                        }
                    }){
                        Text("Cancel")
                            .bold()
                    }
                    .frame(width: 138, height: 48)
                    .padding()
                    
                    Spacer()
                    
                    Button{
                        viewModel.companyIsValid()
                    } label: {
                        Text("OK")
                            .bold()
                    }
                    .frame(width: 138, height: 48)
                    .padding()
                }
                .foregroundColor(.black)
                .frame(width: 336, height: 74)
            }
            .frame(width: 336, height: 214)
            .background(.white)
        }
        .ignoresSafeArea()
        
        
        
    }
}

//struct CompanyPopUp_Previews: PreviewProvider {
//    static var previews: some View {
//        CompanyView(show: .constant(true))
//    }
//}
