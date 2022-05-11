//
//  CompanyViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 11/5/22.
//

import Foundation

class CompanyViewModel: ObservableObject {
    
    let handleOnOkButtonPress: (() -> Void)?
    
    init(handleOnOkButtonPress: (() -> Void)? = nil) {
        self.handleOnOkButtonPress = handleOnOkButtonPress
    }
    
    func companyIsValid() {
        if let handleOnOkButtonPress = handleOnOkButtonPress {
            handleOnOkButtonPress()
        }
    }
}
