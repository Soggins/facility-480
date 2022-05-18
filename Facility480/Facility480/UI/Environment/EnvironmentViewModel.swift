//
//  EnvironmentViewModel.swift
//  Facility480
//
//  Created by Hector Martin on 11/5/22.
//

import Foundation

class EnvironmentViewModel: ObservableObject {
    @Published var isCompanySelected: Bool = false
    @Published var flowControl: MyViewsEnum?
    let flowControlListener: ((MyViewsEnum) -> Void)?
    
    init(flowControlListener: ((MyViewsEnum) -> Void)? = nil){
        self.flowControlListener = flowControlListener
    }
    
    public func handleOnUserLogged() {
        if let flowControlListener = self.flowControlListener {
            flowControlListener(.home)
        }
    }
    
    public func handleOnCompanySelected() {
        if let flowControlListener = self.flowControlListener {
            flowControlListener(.login)
        }
    }
}
