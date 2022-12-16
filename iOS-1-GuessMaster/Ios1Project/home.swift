//
//  home.swift
//  Ios1Project
//
//  Created by CHEN on 2022-11-20.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class home: UIViewController {
    
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        
        loadUserData()
        //listAllUser()
    }
    
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
            } else{
                if let users = querySnapshot?.documents {
                    for user in users {
                        self.charNameLabel.text = user["charName"] as? String
                        self.nameLabel.text = user["name"] as? String
                        self.emailLabel.text = user["email"] as? String
                        self.phoneLabel.text = user["phone"] as? String
                        self.pointsLabel.text = String((user["points"] as? Int)!)
                    }
                }
            }
        }
        
    }
    
    @IBAction func logoutClicked(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}
