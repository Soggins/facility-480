//
//  MakeReservationView.swift
//  Facility480
//
//  Created by Hector Martin on 29/5/22.
//

import SwiftUI

struct MakeReservationView: View {
    @StateObject var viewModel: MakeReservationViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var selectedDate = Date()
    @State private var reservationDates = [Date]()
    @State private var showCalendarOverlay = false
    
//    var selectedDateAsString: String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        return formatter.string(from: reservationDates)
//    }
    
    @ViewBuilder
    private var workstationView: some View {
        Text("a")
    }
    var body: some View {
        ZStack {
            VStack {
                  workstationView
            }
            .toolbar{
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                    Button(action: { self.mode.wrappedValue.dismiss() }) {
                        HStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 10, height: 10)
                                
                            Text("Reserve stall")
                                .padding(.leading, 10)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
