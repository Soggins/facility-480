//
//  MyReservationsView.swift
//  Facility480
//
//  Created by Hector Martin on 2/5/22.
//

import SwiftUI

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
    @StateObject private var viewModel = MyReservationsViewModel()
    
    @State private var selectedTab: MyReservationsTabEnum = .current

    var body: some View {
        NavigationView {
            GeometryReader{ geo in
                ZStack {
                    VStack(spacing: 0) {
                        
                        MyReservationsTopBarView(geoWidth: geo.size.width, selectedTab: $selectedTab)
                        
                        TabView(selection: $selectedTab,
                            content: {
                                Text("1")
                                .tag(MyReservationsTabEnum.current)
                                Text("2")
                                .tag(MyReservationsTabEnum.history)
                            })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                
                    }
                }
//                .ignoresSafeArea()
            }
        }
    }
}

struct MyReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationsView()
    }
}
