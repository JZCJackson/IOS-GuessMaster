//
//  DeleteAccountView.swift
//  GuessMaster2023
//
//  Created by Orange on 2023-04-22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct DeleteAccountView: View {
    @State private var password = ""
    @State private var accountDeleted = false
    @EnvironmentObject var userData: UserData
    
    func reauthenticateAndDeleteAccount() {
        guard let user = Auth.auth().currentUser, let email = user.email else { return }

        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        user.reauthenticate(with: credential) { result, error in
            if let error = error {
                print("Error re-authenticating: \(error.localizedDescription)")
            } else {
                userData.deleteUserData()
                user.delete { error in
                    if let error = error {
                        print("Error deleting account: \(error.localizedDescription)")
                    } else {
                        print("Account deleted")
                        accountDeleted = true
                    }
                }
            }
        }
    }

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Delete Account")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                
                TextField("Enter your password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                NavigationLink(destination: LoginView(), isActive: $accountDeleted) {
                    Button(action: {
                        reauthenticateAndDeleteAccount()
                    }) {
                        Text("Delete Account")
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.61)
                            .frame(height: UIScreen.main.bounds.height * 0.065)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(28)
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView()
    }
}
