//
//  LoginView.swift
//  Ios1Project
//
//  Created by Junzhi Chen on 2023-03-17.
//

import SwiftUI
import FirebaseAuth


struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false
    @State private var showRankListAlert: Bool = false


    var body: some View {
            LoginViewContent(email: $email, password: $password, isActive: $isActive)
                .navigationBarHidden(true)
    }
}

struct LoginViewContent: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var isActive: Bool
    @State private var showAlert: Bool = false
    @State private var hasAgreedToPrivacyPolicy: Bool = false
    
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                DispatchQueue.main.async {
                    isActive = true
                    NotificationCenter.default.post(Notification(name: Notification.Name("LoggedIn")))
                }
            }
        }
    }

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Image("GuessIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.3)
                
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 44, weight: .bold))
                    .padding(.top, 50)
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Email")
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    TextField("", text: $email)
                        .padding()
                        .foregroundColor(.white)
                        .frame(height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0), lineWidth: 3)
                        )
                }
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width * 0.9)

                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password")
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        
                    }
                    SecureField("", text: $password)
                        .padding()
                        .foregroundColor(.white)
                        .frame(height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0), lineWidth: 3)
                        )
                }
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width * 0.9)

                
                // Add the login button
                Button(action: {
                                loginUser()
                            }) {
                                Text("Login")
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width * 0.5)
                                    .foregroundColor(.black)
                                    .frame(height: UIScreen.main.bounds.height * 0.05)
                                    .background(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                                    .cornerRadius(40)
                            }
                            .padding()
//                            .alert(isPresented: $showAlert) {
//                                privacyPolicyAlert
//                            }
                
                // Add the NavigationLink to HomeView
                NavigationLink(destination: MainAppView(), isActive: $isActive) {
                    EmptyView()
                }
                .hidden()
                
                NavigationLink(destination: RegisterView(), label: {
                    Text("Register")
                        .padding()
                        .frame(height: UIScreen.main.bounds.height * 0.05)
                        .frame(width: UIScreen.main.bounds.width * 0.5)
                        .foregroundColor(.black)
                        .background(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                        .cornerRadius(40)
                })
                .padding(.top) // Add a smaller space between the buttons
            }
            .padding()
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
