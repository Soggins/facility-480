//
//  SettingsView.swift
//  Facility480
//
//  Created by Hector Martin on 18/5/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image("HomeBg")
                        .resizable()
                    
                    VStack {
                        Image("userprofilepic")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text("Héctor Martín Fernández")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                        Text("hectormartin@cuatroochenta.com")
                            .foregroundColor(.white.opacity(0.5))
                            .fontWeight(.thin)
                    }
                }
                .frame(height: 354)
                
                List {
                    Button{
                        
                    } label: {
                        HStack {
                            Image(systemName: "gearshape")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 24, height: 24)
                            
                            Text("Configuración")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: "arrowtriangle.right.fill")
                                .resizable()
                                .frame(width: 5, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(height: 83)
                    
                    Button{
                        
                    } label: {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 24, height: 24)
                            
                            Text("Enviar reporte/sugerencia")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: "arrowtriangle.right.fill")
                                .resizable()
                                .frame(width: 5, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(height: 83)
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .toolbar{
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                    Button(action: { self.mode.wrappedValue.dismiss() }) {
                        HStack{
                            Image(systemName: "arrow.left")
                            Text("Mi perfil")
                        }
                        .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu{
                        Button("Cerrar sesión", action: { self.mode.wrappedValue.dismiss() })
                    } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
