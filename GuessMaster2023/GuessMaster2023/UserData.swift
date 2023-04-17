//
//  UserData.swift
//  GuessMaster2023
//
//  Created by Orange on 2023-04-17.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class UserData: ObservableObject {
    @Published var charName: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var points: Int = 0
    
    private let db = Firestore.firestore()
    
    func loadUserData() {
        // getting logged in user data
        let user = Auth.auth().currentUser
        var email: String?
        if let currentUser = user {
            email = currentUser.value(forKey: "email") as? String
        }

        let documents = db.collection("Users").whereField("email", isEqualTo: email!)
        documents.addSnapshotListener { querySnapshot, error in
            if let err = error {
                print("There is an error --- \(err)")
            } else {
                if let users = querySnapshot?.documents {
                    for user in users {
                        self.charName = user["charName"] as? String ?? ""
                        self.name = user["name"] as? String ?? ""
                        self.email = user["email"] as? String ?? ""
                        self.phone = user["phone"] as? String ?? ""
                        self.points = user["points"] as? Int ?? 0
                    }
                }
            }
        }
    }

}

