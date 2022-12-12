//
//  CoinExchange.swift
//  Ios1Project
//
//  Created by CHEN on 2022-11-24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CoinExchange: UIViewController {
    
    @IBOutlet var exchangeLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    let db = Firestore.firestore()
    
    override func viewWillAppear(_ animated: Bool) {
        let user = Auth.auth().currentUser
        var email: String?
        if let currentUser = user {
            email = currentUser.value(forKey: "email") as? String
            print(email!)
        }
        
        let documents = self.db.collection("Users").whereField("email", isEqualTo: email!)
        
        documents.addSnapshotListener { querySnapshot, error in
            if let err = error {
                print("There is an error --- \(err)")
            } else{
                if let users = querySnapshot?.documents {
                    for user in users {
                        let points = user["points"] as! Int
                        print(points)
                        self.pointsLabel.text = String(points)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.pointsLabel.text = String(format: "%.0f", 10)
    }
    
}
