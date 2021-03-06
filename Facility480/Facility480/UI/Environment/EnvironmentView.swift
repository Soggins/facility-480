//
//  EnvironmentView.swift
//  Facility480
//
//  Created by Hector Martin on 10/5/22.
//

import SwiftUI

struct EnvironmentView: View {
    @StateObject var viewModel: EnvironmentViewModel
    @State var showPopUp : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("environmentbg")
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .center) {
                    Image("environmentarrow")
                        .resizable()
                        .frame(width: 75, height: 115)
                        .padding(.top, 90)
                        .padding(.trailing, 75)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    
                    Text("¡Hola!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("Todavía no has seleccionado empresa. Debes hacerlo desde el apartado “Configuración” de la sección de tu perfil.")
                        .padding(.horizontal, 50)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    Spacer()
                }.toolbar{
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                        Image("480logohome")
                            .padding(.horizontal)
                    }
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                        Button{
                            withAnimation{
                                showPopUp = true
                            }
                        } label: {
                            Image("unknownuserprofilepic")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.horizontal, 10)
                        }
                        
                    }
                    
                }
                
                if(showPopUp){
                    withAnimation{
                        CompanyView(viewModel: CompanyViewModel(handleOnOkButtonPress: {
                            viewModel.handleOnCompanySelected()
                        }), show: $showPopUp)
                            .padding(.bottom, 130)
                    }
                }
                
            }
            .ignoresSafeArea()
            
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView(viewModel: EnvironmentViewModel())
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
