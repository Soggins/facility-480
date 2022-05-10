//
//  MyReservationsView.swift
//  Facility480
//
//  Created by Hector Martin on 2/5/22.
//

import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

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
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    

    var body: some View {
            ZStack {
                
                VStack(spacing: 0) {
                    
                    MyReservationsTopBarView(geoWidth: UIScreen.main.bounds.width, selectedTab: $selectedTab)
                        
                    
                    TabView(selection: $selectedTab,
                        content: {
                            MyReservationsTab_Current()
                            .tag(MyReservationsTabEnum.current)
                            MyReservationsTab_History()
                            .tag(MyReservationsTabEnum.history)
                        })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(width: UIScreen.main.bounds.width * 0.95)
                   
            
                }
                .padding(.top, UIScreen.main.bounds.height * 0.12)
                .toolbar{
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                        Button(action: { self.mode.wrappedValue.dismiss() }) {
                            HStack{
                                Image(systemName: "arrow.left")
                                Text("Mis reservas")
                            }
                            .foregroundColor(.black)
                        }
                    }
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing){
                        HStack {
                            Button{
                            } label: {
                            Image(systemName: "slider.vertical.3")
                            }
                            .padding(.trailing, 15)
                            
                            Button {
                            } label: {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                        .foregroundColor(.black)
                        
                    }
                }
            }
            
        
    }
}

struct MyReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        MyReservationsView()
    }
}
