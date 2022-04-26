//
//  HomeView-ViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 25/4/22.
//

import Foundation

extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        @Published var searchbar = ""
    }
}
