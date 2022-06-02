//
//  MakeReservationViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 2/6/22.
//

import Foundation

class MakeReservationViewModel: ObservableObject {
    @Published var selectedType: ReservationType
    
    
    
    init(selectedType: ReservationType){
        self.selectedType = selectedType
    }
}
