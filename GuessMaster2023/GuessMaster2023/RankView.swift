//
//  RankView.swift
//  GuessMaster2023
//
//  Created by Junzhi Chen on 2023-03-22.
//

import SwiftUI
import FirebaseFirestore

struct RankView: View {
    
    @State private var users: [User] = []
    @StateObject private var userData = UserData()
    
    private var db = Firestore.firestore()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Rank")
                    .padding()
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top,50)
                
                GridView(items: users) { user in
                    VStack {
                        Text(user.name)
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .frame(height: UIScreen.main.bounds.height * 0.0065)
                        
                        Text("\(user.points)")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                    }
                    .padding()
                    .background(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                    .cornerRadius(8)
                }
                .padding()
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
        
        db.collection("Users").order(by: "points", descending: true).addSnapshotListener { querySnapshot, error in
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
                    }
                }
            }
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
