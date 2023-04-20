//
//  UserData.swift
//  GuessMaster2023
//
//  Created by Junzhi Chen on 2023-04-17.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserData: ObservableObject {
    @Published var user = [UserModel]()
    private var db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        db.collection("Users").whereField("uid", isEqualTo: userUID).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.user = documents.map { (queryDocumentSnapshot) -> UserModel in
                let data = queryDocumentSnapshot.data()
                
                let uid = data["uid"] as? String ?? ""
                let charName = data["charName"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let phone = data["phone"] as? String ?? ""
                let points = data["points"] as? Int ?? 0
                
                return UserModel(id: queryDocumentSnapshot.documentID, uid: uid, charName: charName, name: name, email: email, phone: phone, points: points)
            }
        }
    }
    
    func updatePoints(newPoints: Int) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        db.collection("Users").whereField("uid", isEqualTo: userUID).getDocuments { querySnapshot, error in
            if let err = error {
                print("There is an error --- \(err)")
            } else {
                if let users = querySnapshot?.documents {
                    for user in users {
                        print("------->\(user.documentID)")
                        self.db.collection("Users").document(user.documentID).setData(["points": newPoints], merge: true)
                    }
                }
            }
        }
    }
    
    func loadUsers() -> [UserModel] {
        db.collection("Users").getDocuments { querySnapshot, error in
            self.user = []
            if error == nil {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        let user = UserModel(id: (document["id"] as? String)!,
                                             uid: (document["uid"] as? String)!,
                                        charName: (document["charName"] as? String)!,
                                        name: (document["name"] as? String)!,
                                        email: (document["email"] as? String)!,
                                        phone: (document["phone"] as? String)! ,
                                        points: (document["points"] as? Int)!)
                        self.user.append(user)
                    }
                }
            }
        }
        return user
    }

}



struct UserModel: Identifiable {
    var id: String
    var uid: String
    var charName: String
    var name: String
    var email: String
    var phone: String
    var points: Int
}
