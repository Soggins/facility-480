//
//  MakeReservationView.swift
//  Facility480
//
//  Created by Hector Martin on 29/5/22.
//

import SwiftUI

struct MakeReservationPopUpView: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack{
            Color.white.opacity(0.1)
            VStack {
                
                
                Rectangle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(height: 1)

            }
            .frame(width: 336, height: 700)
            .background(.white)
        }
        .ignoresSafeArea()
    }
}

struct MakeReservationView: View {
    @StateObject var viewModel: MakeReservationViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var showNextOption1 = false
    @State private var showNextOption2 = false
    @State private var showPopUp1 = false
    @State private var showPopUp2 = false
    
    @ViewBuilder
    private var workstationView: some View {
//        Section {
//            Picker("Choose a zone", selection: $selectedZone) {
//                ForEach(viewModel.zones, id: \.self) {
//                    Text($0.name)
//                }
//            }
//        }
        HStack {
            VStack (alignment: .leading, spacing: 4){
                Text("ZONE")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                
                Button {
                    withAnimation{
                        showPopUp1 = true
                    }
                } label: {
                    HStack {
                        Text(viewModel.selectedZone?.name ?? "Select")
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
        
        if viewModel.selectedZone != nil {
            HStack {
                VStack (alignment: .leading, spacing: 4){
                    Text("STALL")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                    
                    Button {
                        withAnimation{
                            showPopUp2 = true
                        }
                    } label: {
                        HStack {
                            Text(viewModel.selectedWorkstation?.name ?? "Select")
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
        
        Spacer()
        
        if viewModel.selectedWorkstation != nil {
            Button{
                viewModel.makeWorkstationReservation()
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
        }
    }
    
    
    
    
    
    @ViewBuilder
    private var vehicleView: some View {
        Text("a")
    }
    @ViewBuilder
    private var housingView: some View {
        Text("a")
    }
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
                                    showNextOption1 = true
                                    viewModel.selectedZone = nil
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
                
                if showNextOption1 {
                    switch viewModel.selectedType {
                    case .workstation:
                        workstationView
                    case .vehicle:
                        vehicleView
                    case .housing:
                        housingView
                    }
                }
                
                
                Spacer()
                
            }
            .padding(.horizontal, 24)
            .onAppear {
                viewModel.getZones()
            }
            .toolbar{
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                    Button(action: { self.mode.wrappedValue.dismiss() }) {
                        HStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 10, height: 10)
                                
                            Text("Reserve \(viewModel.selectedType == .workstation ? "stall" : viewModel.selectedType == .vehicle ? "vehicle" : "housing")")
                                .padding(.leading, 10)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            
            switch viewModel.selectedType {
            case .workstation:
                if showPopUp1 {
                    ZStack{
                        Color.black.opacity(0.1)
                            .ignoresSafeArea()
                        VStack {
                            HStack {
                                Button {
                                    showPopUp1 = false
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                }
                                .foregroundColor(.black)
                                Spacer()
                            }
                            .padding()
                            ScrollView {
                                ForEach(viewModel.zones, id: \.self) { zone in
                                    Button {
                                        viewModel.selectedZone = zone
                                        viewModel.selectedWorkstation = nil
                                        viewModel.getWorkstations()
                                        showPopUp1 = false
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
                            .padding(.bottom)
                        }
                        .frame(width: 336, height: 500)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1))
                    }
                }
                
                if showPopUp2 {
                    ZStack{
                        Color.black.opacity(0.1)
                            .ignoresSafeArea()
                        VStack {
                            HStack {
                                Button {
                                    showPopUp2 = false
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                }
                                .foregroundColor(.black)
                                Spacer()
                            }
                            .padding()
                            ScrollView {
                                ForEach(viewModel.workstations, id: \.self) { workstation in
                                    Button {
                                        viewModel.selectedWorkstation = workstation
                                        showPopUp2 = false
                                    } label: {
                                        VStack {
                                            HStack {
                                                Text(workstation.name)
                                                Spacer()
                                                Image(systemName: "arrowtriangle.right.fill")
                                            }
                                            .foregroundColor(workstation.available ? .black : .gray.opacity(0.7))
                                            Rectangle()
                                                .foregroundColor(.gray.opacity(0.1))
                                                .frame(height: 1)
                                        }
                                    }
                                    .disabled(!workstation.available)
                                }
                                .padding(.horizontal)
                                Spacer()
                            }
                            .padding(.bottom)
                        }
                        .frame(width: 336, height: 500)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1))
                    }
                }
                
                
            case .vehicle:
                Text("a")
            case .housing:
                Text("a")
            }
            
            
            
            
            
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
