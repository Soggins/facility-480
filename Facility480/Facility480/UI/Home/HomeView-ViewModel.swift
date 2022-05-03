//
//  HomeView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 25/4/22.
//

import Foundation

class HomeViewModel: ObservableObject {
        @Published var searchbar = ""
        
        @Published var toAllReservations: Bool = false
}


