//
//  CompanyViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 11/5/22.
//

import Foundation

class CompanyViewModel: ObservableObject {
    
    @Published var companyCode: String = ""
    
    let handleOnOkButtonPress: (() -> Void)?
    
    init(handleOnOkButtonPress: (() -> Void)? = nil) {
        self.handleOnOkButtonPress = handleOnOkButtonPress
    }
    
    func checkCompany() -> Bool {
        //company not implemented in backend
        if companies.contains(companyCode) {
            if let handleOnOkButtonPress = self.handleOnOkButtonPress {
                handleOnOkButtonPress()
            }
            return true
        }
        return false
    }
}
