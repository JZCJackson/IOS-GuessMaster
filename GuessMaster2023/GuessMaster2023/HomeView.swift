//
//  HomeView.swift
//  Ios1Project
//
//  Created by Orange on 2023-03-17.
//

import SwiftUI

struct HomeView: View {
    @State private var charName: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var points: Int = 0
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
//    private let db = Firestore.firestore()
    
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
                
                Text("Char Name: \(charName)")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            }

            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("Name: \(name)")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            }
           
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("Email: \(email)")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
            }
            
            ZStack {
                Image("group8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1) // Adjust the width and height as needed
                    .clipped()
                
                Text("Phone: \(phone)")
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

                
                Text("Points: \(points)")
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
            
        }
        .navigationBarTitle("", displayMode: .inline)
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

