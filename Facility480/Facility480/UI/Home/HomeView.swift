//
//  HomeView.swift
//  Facility480
//
//  Created by Hector Martin on 20/4/22.
//

import SwiftUI


enum HomeViewsEnum: Hashable, Identifiable {

    case makeReservation, myReservations, reservationDetails, settings
    
    var id: String {
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
    @State var searchbar = ""
    
    //when optional currentReservations = nil
    let emptyReservations: [Reservation] = []
    
//    var timeUntilNextReservation: String {
//        let todayDate = Date.now
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "mm.dd.yy"
//        let nextReservationDate = dateFormatter.date(from: viewModel.nextReservation!.date)
//
//        
//        return ""
//    }
    
    
    
    private func activeLink() -> Binding<HomeViewsEnum?> {
        return Binding(get: {
            return viewModel.flowControl
        }, set: {
            viewModel.flowControl = $0
        })
    }
    
    @ViewBuilder
    private var navigationLinks: some View {
        NavigationLink(tag: HomeViewsEnum.myReservations, selection: activeLink(),
               destination: {
            MyReservationsView(viewModel: MyReservationsViewModel(currentReservations: viewModel.currentReservations ?? emptyReservations, pastReservations: viewModel.pastReservations ?? emptyReservations, repositories: viewModel.repositories))
//                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        },
               label: {
                    EmptyView()
        })
        NavigationLink(tag: HomeViewsEnum.reservationDetails, selection: activeLink(),
               destination: {
            ReservationDetailsView(viewModel: ReservationDetailsViewModel(reservation: viewModel.selectedReservation!, repositories: viewModel.repositories, onDismiss: {
                viewModel.flowControl = nil
                viewModel.selectedReservation = nil
            }))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .onDisappear{
                    viewModel.flowControl = nil
                    viewModel.selectedReservation = nil
                    reloadReservations()
                }
        },
               label: {
                    EmptyView()
        })
        NavigationLink(tag: HomeViewsEnum.makeReservation, selection: activeLink(), destination: {
            MakeReservationView(viewModel: MakeReservationViewModel(selectedType: viewModel.selectedType, repositories: viewModel.repositories))
                .navigationBarBackButtonHidden(true)
        }, label: {
            EmptyView()   
        })
        NavigationLink(tag: HomeViewsEnum.settings, selection: activeLink(),
               destination: {
            SettingsView()
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
                                    
                                    TextField("Buscar", text: $searchbar)
                                        
                                }
                            }
                            
                            Spacer()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    Group {
                                        Button{
                                            viewModel.selectedType = .workstation
                                            viewModel.handleOnMakeReservation()
                                        } label: {
                                            ReservationItemButton(facilityName: "workstation")
                                        }
                                        Button{
                                            viewModel.selectedType = .housing
                                            viewModel.handleOnMakeReservation()
                                        } label: {
                                            ReservationItemButton(facilityName: "housing")
                                        }
                                        Button{
                                            viewModel.selectedType = .vehicle
                                            viewModel.handleOnMakeReservation()
                                        } label: {
                                            ReservationItemButton(facilityName: "vehicle")
                                        }
                                            .padding(.trailing, 33)
                                    }
                                    .padding(.leading, 33)
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
                    
                    if viewModel.nextReservation != nil {
                        Button {
                            viewModel.selectedReservation = viewModel.nextReservation
                            viewModel.handleOnDetails()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .foregroundColor(.gray.opacity(0.2))
                                
                                VStack{
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Próxima reserva en 0d 3h 29m")
                                                .fontWeight(.bold)
                                            Text("\(viewModel.nextReservation?.date.replacingOccurrences(of: ".", with: "/") ?? "null") \(viewModel.nextReservation?.getName() ?? "error")")
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
                        .padding(.bottom, 5)
                    }
                    
                    List {
                        ForEach(viewModel.currentReservations ?? emptyReservations, id: \.self) { reservation in
                            Button {
                                
                            } label: {
                                ReservationItem(reservation: reservation, selectedReservation: $viewModel.selectedReservation, action: {
                                    viewModel.deleteReservation(reservation)
                                })
                                
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        }
                    }
                    .onChange(of: viewModel.selectedReservation, perform: { reservation in
                        if let _ = reservation {
                            viewModel.handleOnDetails()
                        }
                    })
                    .onChange(of: viewModel.currentReservations, perform: { reservation in
                        viewModel.getNextReservation()
                    })
                    .listStyle(PlainListStyle())
                    
                    
                    
                    Spacer()
                }
                .onAppear(){
                    reloadReservations()
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
                            Image("userprofilepic")
                                .resizable()
                                .frame(width: 40, height: 40)
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
    
    private func reloadReservations() {
        viewModel.getNextReservation()
        viewModel.getCurrentReservations()
        viewModel.getPastReservations()
    }
}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(viewModel: HomeViewModel())
//    }
//}
