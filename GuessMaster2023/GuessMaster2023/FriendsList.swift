//
//  FriendsList.swift
//  iOS-Assignment-2
//
//  Created by Shally Sharma on 2023-03-20.
//

import SwiftUI
import FirebaseFirestore

struct FriendsList: View {
    
    @State private var users: [User] = []
    @StateObject private var userData = UserData()
    
    private var db = Firestore.firestore()
    
    var body: some View {
        VStack {
            
            Text("FriendList")
                .foregroundColor(.white)
                .font(.system(size: 44, weight: .bold))
                .padding(.top, 50)
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                Grid {
                    ForEach(users, id: \.uid) { user in
                        Text("\(user.name)")
                            .listRowBackground(Color.black)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .frame(height: 52)
                            .font(.system(size: 21))
                            .padding(.top, 50)
                    }
                }
                .padding()
                .background(Color.green)
                .cornerRadius(8)
                .onAppear {
                    loadUsers()
                }
            }
        }
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func loadUsers() {
        // Add sample data for testing or fetch data from a databas
        db.collection("Users").getDocuments { (querySnapshot, error) in
            self.users = []
            if error == nil {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        let user = User(id: (document["id"] as? String) ?? "",
                                        uid: (document["uid"] as? String)!,
                                        charName: (document["charName"] as? String)!,
                                        name: (document["name"] as? String)!,
                                        email: (document["email"] as? String)!,
                                        phone: (document["phone"] as? String)! ,
                                        points: (document["points"] as? Int)!)
                        
                        self.users.append(user)
                        print("\(user)")
                    }
                }
            }
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
