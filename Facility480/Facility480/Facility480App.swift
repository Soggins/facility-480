//
//  Facility480App.swift
//  Facility480
//
//  Created by Hector Martin on 11/4/22.
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

enum MyViewsEnum: Hashable, CaseIterable, Identifiable {

    case home, login, company
    
    var id: String {
        return self.getName()
    }
    
    func getName() -> String {
        switch self {
        case .company:
            return "company"
        case .login:
            return "login"
        case .home:
            return "home"
        }
    }
}

@main
struct Facility480App: App {
    @StateObject var viewModel = MainViewModel()
    
//    private func activeLink() -> Binding<MyViewsEnum?> {
//        return Binding(get: {
//            //print(viewModel.flowControl)
//            return viewModel.flowControl
//        }, set: {
//            viewModel.flowControl = $0
//        })
//    }
    
//    @ViewBuilder
//    private var navigationLinks: some View {
//        NavigationLink(tag: MyViewsEnum.login, selection: activeLink(),
//               destination: {
//                    LoginView(viewModel: LoginViewModel())},
//               label: {
//                    EmptyView()
//        })
//    }
    
    @ViewBuilder
    private func getLoginView() -> some View {
        LoginView(viewModel: LoginViewModel(handleOnLogin: {
            viewModel.flowControl = .home
        }))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func getHomeView() -> some View {
        HomeView(viewModel: HomeViewModel())
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func getEnvironmentView() -> some View {
        EnvironmentView(viewModel: EnvironmentViewModel(flowControlListener: {
            viewModel.flowControl = $0
        }))
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch viewModel.flowControl {
                case .login:
                    getLoginView()
                case .home:
                    getHomeView()
                default:
                    getEnvironmentView()
                }
                
                
            }
        }
    }
}
