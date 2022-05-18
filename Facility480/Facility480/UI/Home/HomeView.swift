//
//  HomeView.swift
//  Facility480
//
//  Created by Hector Martin on 20/4/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var showDetail = false
    let reservation = Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 2)
    
    
    var body: some View {
        
            ZStack {
                VStack {
                    ZStack {
                        
                        Image("HomeBg")
                            .resizable()
                            
                        
                        VStack {
                            HStack(spacing: 0) {
                                Image(systemName: "mappin")
                                    .foregroundColor(.white)
                                Group {
                                    Text("Castellón de la Plana,")
                                        .fontWeight(.bold)
                                    Text("ES")
                                }
                                    .foregroundColor(.white)

                                Spacer()
                            }
                            .padding(.top, UIScreen.main.bounds.height * 0.1)
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.07)
                            .padding(.bottom, UIScreen.main.bounds.height * 0.01)
                            
                            Text("¿Qué tipo de espacio quieres reservar?")
                                .foregroundColor(.white)
                                .font(.headline)
                                
                            ZStack{
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width * 0.86, height: UIScreen.main.bounds.height * 0.054)
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                                
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .padding(.leading, UIScreen.main.bounds.width * 0.1)
                                    
                                    TextField("Buscar", text: $viewModel.searchbar)
                                        
                                }
                            }
                            .padding(.bottom, UIScreen.main.bounds.height * 0.015)
                            
                            Spacer()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(0..<10) { number in
                                        Button {
                                        } label: {
                                        ReservationItemButton(facilityName: "Vehicle")
                                            .padding(.leading, UIScreen.main.bounds.width * 0.075)
                                            .padding(.trailing, number == 9 ? UIScreen.main.bounds.width * 0.075 : 0)
                                        }
                                    }
                                }
                            }

                            Spacer()
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.49)
                    
                    HStack {
                        Text("Mis reservas")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        NavigationLink(isActive: $viewModel.toAllReservations, destination:{
                            MyReservationsView()
                                .ignoresSafeArea()
                                .navigationBarBackButtonHidden(true)
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .foregroundColor(.green)
                                
                                
                                Text("Ver todas")
                                    .foregroundColor(.black)
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.26, height: UIScreen.main.bounds.height * 0.04)
                        })
                    }
                    .padding()
                    
                    NavigationLink(isActive: $showDetail, destination:{
                        ReservationDetailsView(reservation: reservation)
                            .ignoresSafeArea()
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .foregroundColor(.gray.opacity(0.2))
                            
                            VStack{
                                HStack {
                                    VStack {
                                        Text("Próxima reserva en 0d 3h 29m")
                                            .fontWeight(.bold)
                                        Text("12:30 Sala puerta de Tanhäusen")
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
                    })
                    
                    
                    
                    
                    Spacer()
                }
                .toolbar{
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                        Image("480logohome")
                            .padding(.horizontal)
                    }
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing){
                        Image(systemName: "bell.fill")
                            
                        Circle()
                            .fill()
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    }
                    
                }
                
                
                
//                NavigationLink(destination: ReservationDetailsView(), isActive: $showDetail, label: {
//                    EmptyView()
//                })
            }
            
            
        
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
