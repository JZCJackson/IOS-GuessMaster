//
//  RegisterView.swift
//  Ios1Project
//
//  Created by Orange on 2023-03-17.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
//    private let db = Firestore.firestore()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Register")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                
                
                ZStack(alignment: .leading) {
                    if username.isEmpty {
                        Text("Username")
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    TextField("", text: $username)
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
                    if phone.isEmpty {
                        Text("Phone")
                            .foregroundColor(.white)
                        
                            .padding(.leading, 10)
                    }
                    TextField("", text: $phone)
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
                
                
                
                
                
                ZStack(alignment: .leading) {
                    if confirmPassword.isEmpty {
                        Text("Confirm Password")
                        
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    TextField("", text: $confirmPassword)
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
                    Button(action: {
                        //connect db
                    }) {
                        Text("Register")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .frame(height: UIScreen.main.bounds.height * 0.05)
                    .background(Color(red: 137.0/255.0, green: 134/255.0, blue: 252/255.0))
                    .cornerRadius(40)
                }
                .padding(.top)
                
                ZStack(alignment: .leading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Have an account? Sign in")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .frame(height: UIScreen.main.bounds.height * 0.05)
                    .background(Color(red: 33.0/255.0, green: 14/255.0, blue: 252/255.0))
                    .cornerRadius(40)
                }
                .padding(.top)
            }
        }
    }
    }


struct RegisterView_Previews: PreviewProvider {
static var previews: some View {
RegisterView()
}
}


