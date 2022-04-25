//
//  HomeView.swift
//  Facility480
//
//  Created by Hector Martin on 20/4/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    ZStack {
                        
                        Image("HomeBg")
                            .resizable()
                        
                        VStack {
                            Text("Localización")
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.49)
                    
                    Spacer()
                }
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading){
                        Image("480logohome")
                            .padding(.horizontal)
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        Image(systemName: "bell")
                            
                        Circle()
                            .fill()
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    }
                    
                }
            }
            .ignoresSafeArea()
        }
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
