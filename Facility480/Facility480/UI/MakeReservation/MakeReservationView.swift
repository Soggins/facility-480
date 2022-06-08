//
//  MakeReservationView.swift
//  Facility480
//
//  Created by Hector Martin on 29/5/22.
//

import SwiftUI

struct ReservationItemOption: View {
    var title: String
    var name: String
    @Binding var showPopUp: Bool
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 4){
                Text(title.uppercased())
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                
                Button {
                    withAnimation{
                        showPopUp = true
                    }
                } label: {
                    HStack {
                        Text(name)
                        Spacer()
                        Image(systemName: "arrowtriangle.right.fill")
                            .resizable()
                            .frame(width: 5, height: 10)
                    }
                }
                .foregroundColor(.black)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.2))
            }
            .frame(height: 56)
            Spacer()
        }
    }
}

struct MakeReservationView: View {
    @StateObject var viewModel: MakeReservationViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var reservationDisplayName: String {
        switch viewModel.selectedType {
        case .workstation:
            return "stall"
        case .housing:
            return "housing"
        case .vehicle:
            return "vehicle"
        }
    }
    
    @State private var showNextOption = false
    @State private var showPopUpZones = false
    @State private var showPopUp = false

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: 4){
                        Text("DATE")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                        
                        HStack {
                            DatePicker("Select dates", selection: $viewModel.selectedDate, displayedComponents: [.date])
                                .labelsHidden()
                                .onChange(of: viewModel.selectedDate, perform: { _ in
                                    showNextOption = true
                                    if viewModel.selectedType != .workstation {
                                        viewModel.getItems()
                                    }
                                    viewModel.selectedZone = nil
                                    viewModel.selectedItem = nil
                                })
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                                .padding(.leading, 5)
                            Spacer()
                        }
                        Rectangle()
                            .frame(width: 160, height: 1)
                            .foregroundColor(.gray.opacity(0.2))
                    }
                    .frame(width: 160, height: 56)
                    Spacer()
                }
                
                
                
                if showNextOption {
                    if viewModel.selectedType == .workstation {
                        ReservationItemOption(title: "zone", name: viewModel.selectedZone?.name ?? "Select", showPopUp: $showPopUpZones)
                        
                        if viewModel.selectedZone != nil {
                            ReservationItemOption(title: reservationDisplayName, name: viewModel.selectedItem?.name ?? "Select", showPopUp: $showPopUp)
                        }
                    } else {
                        ReservationItemOption(title: reservationDisplayName, name: viewModel.selectedItem?.name ?? "Select", showPopUp: $showPopUp)
                    }
                }

                Spacer()
                
                if viewModel.selectedItem != nil {
                    Button{
                        viewModel.makeReservation()
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 300, height: 40)
                                .foregroundColor(.green)
                                .clipShape(Capsule())
                            
                            Text("Make reservation")
                                .bold()
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
            .padding(.horizontal, 24)
            .toolbar{
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                    Button(action: { self.mode.wrappedValue.dismiss() }) {
                        HStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 10, height: 10)
                                
                            Text("Reserve \(reservationDisplayName)")
                                .padding(.leading, 10)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            

            if showPopUpZones {
                ZStack{
                    Color.black.opacity(0.1)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showPopUpZones = false
                            }
                        }
                    VStack {
                        ScrollView {
                            ForEach(viewModel.zones, id: \.self) { zone in
                                Button {
                                    viewModel.selectedZone = zone
                                    viewModel.selectedItem = nil
                                    viewModel.getItems()
                                    showPopUpZones = false
                                } label: {
                                    VStack {
                                        HStack {
                                            Text(zone.name)
                                            Spacer()
                                            Image(systemName: "arrowtriangle.right.fill")
                                        }
                                        .foregroundColor(.black)
                                        Rectangle()
                                            .foregroundColor(.gray.opacity(0.1))
                                            .frame(height: 1)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                    .frame(width: 336, height: 500)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1))
                }
            }
            
            if showPopUp {
                ZStack{
                    Color.black.opacity(0.1)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showPopUp = false
                            }
                        }
                    VStack {
                        ScrollView {
                            ForEach(viewModel.reservationItems, id: \.self) { reservationItem in
                                Button {
                                    viewModel.selectedItem = reservationItem
                                    showPopUp = false
                                } label: {
                                    VStack {
                                        HStack {
                                            Text(reservationItem.name)
                                            Spacer()
                                            Image(systemName: "arrowtriangle.right.fill")
                                        }
                                        .foregroundColor(reservationItem.available ? .black : .gray.opacity(0.7))
                                        Rectangle()
                                            .foregroundColor(.gray.opacity(0.1))
                                            .frame(height: 1)
                                    }
                                }
                                .disabled(!reservationItem.available)
                            }
                            .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                    .frame(width: 336, height: 500)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1))
                }
            }
            
            
            
            
            
            
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
