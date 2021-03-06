//
//  LoginView.swift
//  Facility480
//
//  Created by Hector Martin on 11/4/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel : LoginViewModel
    @State var showPassword: Bool = false
    
    @State var invalidAttempts = 0
    
    
    var body: some View {
        
        ZStack {
            
                VStack {
                    
                    ZStack {
                        Image("Topbg")
                            .resizable()
                        
                        Image("480logo")
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.28)
                    
                    Text("Iniciar sesión")
                        .bold()
                        .padding(10)
                        .foregroundColor(.gray)
                        
                    Group {
                        TextField("Email", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .frame(width: 311,height: 30)
                            .padding()
                            .keyboardType(.emailAddress)
                    
                        HStack {
                            if showPassword{
                                TextField("Password", text: $viewModel.password)
                                    .textInputAutocapitalization(.never)
                            } else {
                                SecureField("Password", text: $viewModel.password)
                                    .textInputAutocapitalization(.never)
                            }
                            
                            Button{
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                            }
                            .foregroundColor(.gray)
                        }
                        .frame(width: 311,height: 30)
                        .padding()
                    }
                    .modifier(ShakeEffect(animatableData: CGFloat(invalidAttempts)))
                    .onChange(of: viewModel.invalidAttempts) { _ in
                        withAnimation{
                        invalidAttempts += 1
                        }
                    }
                    
                    
                    HStack (){
                        Toggle("", isOn: $viewModel.recordar)
                            .labelsHidden()
                            .padding(.leading)
                        
                        Text("Recuérdame")
                        
                        Spacer()
                        
                        Text("Olvidé mi contraseña")
                            .bold()
                            .underline()
                            .font(.caption)
                            .padding(.horizontal)
                            
                    }
                    .padding(.vertical)
                    
                    Button{
                        viewModel.logIn()
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 300, height: 40)
                                .foregroundColor(.green)
                                .clipShape(Capsule())
                            
                            Text("Iniciar sesión")
                                .bold()
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Group {
                        HStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: 1)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            
                            Text("o iniciar sesión en")
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                            
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: 1)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                        .padding()
                        
                        HStack {
                            
                            Button {
                                
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.gray, lineWidth: 2)
                                        
                                        
                                    HStack {
                                        Image("googleicon")
                                            .padding(.leading, 2)
                                        Text("Google")
                                            .bold()
                                            .font(.system(size: 16))
                                            .padding(.horizontal, 10)
                                            .foregroundColor(.gray)
                                    }
                                        
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.35, height: 40)
                            }
                            
                            Button {
                                
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.gray, lineWidth: 2)
                                        
                                        
                                    HStack {
                                        Image("microsofticon")
                                            .padding(.leading, 2)
                                        Text("Microsoft")
                                            .bold()
                                            .font(.system(size: 16))
                                            .padding(.horizontal, 10)
                                            .foregroundColor(.gray)
                                    }
                                        
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.35, height: 40)
                            }
                        }
                    }
                    
                    HStack {
                        Text("¿Todavía no tienes cuenta?")
                        Text("Regístrate")
                            .bold()
                            .underline()
                    }
                    .font(.caption)
                    .padding()
                    
                    Spacer()
                }
            
            
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
