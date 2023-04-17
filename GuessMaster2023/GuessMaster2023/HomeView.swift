//
//  HomeView.swift
//  Ios1Project
//
//  Created by Orange on 2023-03-17.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct HomeView: View {
    @StateObject private var userData = UserData()
    @State private var isLoggedOut: Bool = false

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let db = Firestore.firestore()
    
//    private func loadUserData() {
//        guard let user = Auth.auth().currentUser, let userEmail = user.email else { return }
//
//        db.collection("Users").whereField("email", isEqualTo: userEmail)
//            .getDocuments { querySnapshot, error in
//                if let err = error {
//                    print("There is an error --- \(err)")
//                } else {
//                    if let users = querySnapshot?.documents {
//                        for user in users {
//                            charName = user["charName"] as? String ?? ""
//                            name = user["name"] as? String ?? ""
//                            email = user["email"] as? String ?? ""
//                            phone = user["phone"] as? String ?? ""
//                            points = user["points"] as? Int ?? 0
//                        }
//                    }
//                }
//            }
//    }

    
    var body: some View {
        //        TabView {
        VStack {
//            Spacer()
            Text("Home")
                .foregroundColor(.white)
                .font(.system(size: 44, weight: .bold))
                
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("Char Name: \(userData.charName)")

                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }

            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("Name: \(userData.name)")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }
           
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("Email: \(userData.email)")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }
            
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("Phone: \(userData.phone)")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            }
          
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width * 0.58)

                
                Text("Points: \(userData.points)")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                
            }
            
            NavigationLink(destination: LoginView(), label: {
                Text("Logout")
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.61)
                    .frame(height: UIScreen.main.bounds.height * 0.065)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(28)
            })
            .padding(.top,20)
            .onTapGesture {
                do {
                    try Auth.auth().signOut()
                    isLoggedOut = true
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading: EmptyView()) // Add this line to hide the back button
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
                userData.loadUserData()
            }
    }
        
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

