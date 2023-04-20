//
//  HomeView.swift
//  Ios1Project
//
//  Created by Junzhi Chen on 2023-03-17.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct HomeView: View {
    @State private var isLoggedOut: Bool = false
    @StateObject private var userData = UserData()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let db = Firestore.firestore()
    
    var body: some View {
        //        TabView {
        VStack {
//            Spacer()
            if let user = userData.user.first {
            Text("Home")
                .foregroundColor(.white)
                .font(.system(size: 44, weight: .bold))
                
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
//                Text("Char Name: \(charName)")
                Text(" \(user.charName)")


                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
            }

            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("\(user.name)")

                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
            }
           
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("\(user.email)")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
            }
            
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("\(user.phone)")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
            }
          
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width * 0.58)

                
                Text("Points: \(user.points)")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
                
            }
            } else {
                           Text("Loading user data...")
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
        
    }
        
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

