//
//  HomeView.swift
//  Facility480
//
//  Created by Hector Martin on 20/4/22.
//

import SwiftUI

enum HomeViewsEnum: Hashable, CaseIterable, Identifiable {

    case makeReservation, myReservations, reservationDetails, settings
    
    var id: String {
        self.getName()
    }
    
    func getName() -> String {
        switch self {
        case .makeReservation:
            return "makeReservation"
        case .myReservations:
            return "myReservation"
        case .reservationDetails:
            return "reservationDetails"
        case .settings:
            return "settings"
        }
    }
}

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var showDetail = false
    let reservation = Reservation(name: "Puesto de trabajo 45", time: "Lunes 31 may. | 8:00 a 17:30", price: 2)
    
    private func activeLink() -> Binding<HomeViewsEnum?> {
        return Binding(get: {
            print(viewModel.flowControl)
            return viewModel.flowControl
        }, set: {
            viewModel.flowControl = $0
        })
    }
    
    @ViewBuilder
    private var navigationLinks: some View {
        NavigationLink(tag: HomeViewsEnum.myReservations, selection: activeLink(),
               destination: {
            MyReservationsView(viewModel: MyReservationsViewModel(handleOnDetails: {
                viewModel.handleOnDetails()
            }))
//                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        },
               label: {
                    EmptyView()
        })
        NavigationLink(tag: HomeViewsEnum.reservationDetails, selection: activeLink(),
               destination: {
            ReservationDetailsView(reservation: reservation)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        },
               label: {
                    EmptyView()
        })
        NavigationLink(tag: HomeViewsEnum.settings, selection: activeLink(),
               destination: {
            SettingsView()
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        },
               label: {
                    EmptyView()
        })
    }
    
    var body: some View {
        NavigationView {
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
                                    .frame(width: 325, height: 44)
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                                
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .padding(.leading, UIScreen.main.bounds.width * 0.1)
                                    
                                    TextField("Buscar", text: $viewModel.searchbar)
                                        
                                }
                            }
                            
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
                    .frame(height: 354)
                    
                    HStack {
                        Text("Mis reservas")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button{
                            viewModel.handleOnViewAll()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .foregroundColor(.green)
                                
                                
                                Text("Ver todas")
                                    .foregroundColor(.black)
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.26, height: UIScreen.main.bounds.height * 0.04)
                        }
                    }
                    .padding()
                    
                    Button {
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
                    }
                    
                    
                    
                    
                    Spacer()
                }
                .toolbar{
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                        Image("480logohome")
                            .padding(.horizontal)
                    }
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing){
                        Image(systemName: "bell.fill")
                            
                        Button{
                            viewModel.handleOnSettings()
                        } label: {
                            Circle()
                                    .fill()
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                        }
                    }
                    
                }
                
                
                navigationLinks
//                NavigationLink(destination: ReservationDetailsView(), isActive: $showDetail, label: {
//                    EmptyView()
//                })
            }
            .ignoresSafeArea()
        }
            
            
        
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
