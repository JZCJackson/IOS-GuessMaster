//
//  ExchangeTwoController.swift
//  Ios1Project
//
//  Created by CHEN on 2022-12-12.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ExchangeTwoController: UIViewController {

    @IBOutlet var code: UILabel!
    @IBOutlet var show: UIButton!
    @IBOutlet weak var successLabel: UILabel!
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func redeemPoints() {
        
        // getting logged in user data
        let user = Auth.auth().currentUser
        var email: String?
        if let currentUser = user {
            email = currentUser.value(forKey: "email") as? String
        }
        
        // fetching points of current user
        let documents = db.collection("Users").whereField("email", isEqualTo: email!)
        documents.getDocuments { [self] querySnapshot, error in
            if let err = error {
                print("There is an error --- \(err)")
            } else{
                if let users = querySnapshot?.documents {
                    for user in users {
                        var points = (user["points"] as? Int)!
                        points = points - 100
                        self.db.collection("Users").document(user.documentID).setData(["points" : points], merge: true)
                        self.successLabel.text = "Points Redeemed Successfully"
                    }
                }
            }
        }
        
    }
    
    @IBAction func showCode(_ sender: UIButton) {
        let randomInt = Int.random(in: 0..<999999999)
        code.text = String(randomInt)
        show.isEnabled = false
        
        redeemPoints()
    }
    

}
