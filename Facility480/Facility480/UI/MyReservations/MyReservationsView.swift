//
//  MyReservationsView.swift
//  Facility480
//
//  Created by Hector Martin on 2/5/22.
//

import SwiftUI

enum MyReservationsViewsEnum: Hashable, Identifiable {

    case reservationDetails
    
    var id: String {
        switch self {
        case .reservationDetails:
            return "reservationDetails"
        }
    }
}

enum MyReservationsTabEnum: Hashable, CaseIterable{
    case current, history
    
    var id: String{
        return self.getName()
    }
    
    func getName() -> String {
        switch self {
        case .current:
            return "ACTUALES"
        case .history:
            return "HISTÓRICO"
        }
    }
}

struct MyReservationsView: View {
    @StateObject var viewModel: MyReservationsViewModel
    
    @State private var selectedTab: MyReservationsTabEnum = .current
    
    @State var selectedReservation: Reservation?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    private func activeLink() -> Binding<MyReservationsViewsEnum?> {
        return Binding(get: {
            return viewModel.myReservationsFlowControl
        }, set: {
            viewModel.myReservationsFlowControl = $0
        })
    }

    
    @ViewBuilder
    private var navigationLinks: some View {
        NavigationLink(tag: MyReservationsViewsEnum.reservationDetails, selection: activeLink(), destination: {
                        ReservationDetailsView(viewModel: ReservationDetailsViewModel(reservation: selectedReservation ?? Reservation(reservation_id: "error", date: "error", type: "error"), repositories: viewModel.repositories, onDismiss: {
        selectedReservation = nil}, onReservationDelete: {
            viewModel.handleOnReservationDelete($0)
        }))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
//                .onDisappear{
//                    selectedReservation = nil
//                }
        }, label: {
        EmptyView()
        })
    }

    var body: some View {
            ZStack {
                VStack(spacing: 0) {
                    
                    MyReservationsTopBarView(geoWidth: UIScreen.main.bounds.width, selectedTab: $selectedTab)
                        
                    
                    TabView(selection: $selectedTab,
                        content: {
                        MyReservationsTab(viewModel: viewModel, selectedReservation: $selectedReservation, reservations: viewModel.currentReservations)
                            .tag(MyReservationsTabEnum.current)
                        MyReservationsTab(viewModel: viewModel, selectedReservation: $selectedReservation, reservations: viewModel.pastReserations)
                            .tag(MyReservationsTabEnum.history)
                        })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(width: UIScreen.main.bounds.width * 0.95)
                    
                   
            
                }
                .toolbar{
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                        Button(action: { self.mode.wrappedValue.dismiss() }) {
                            HStack{
                                Image(systemName: "arrow.left")
                                Text("Mis reservas")
                            }
                            .foregroundColor(.black)
                        }
                    }
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing){
                        HStack {
                            Button{
                            } label: {
                            Image(systemName: "slider.vertical.3")
                            }
                            .padding(.trailing, 15)
                            
                            Button {
                            } label: {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                        .foregroundColor(.black)
                        
                    }
                }
                navigationLinks
            }
            .navigationBarTitleDisplayMode(.inline)
            
        
    }
}

//struct MyReservationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyReservationsView(viewModel: MyReservationsViewModel())
//    }
//}
