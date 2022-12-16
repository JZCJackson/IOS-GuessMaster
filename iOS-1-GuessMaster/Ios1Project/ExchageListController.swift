//
//  ExchageListController.swift
//  Ios1Project
//
//  Created by CHEN on 2022-12-12.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ExchageListController: UIViewController {
    
    let db = Firestore.firestore()
    var points: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchPoints(segue: String) {
        
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
                        self.points = (user["points"] as? Int)!
                        print("Points: \(points)")
                    }
                }
            }
            
            if (points < 100) {
                //creating button alert
                let buttonAlert = UIAlertController(title: "Sorry :(", message: "You don't have enough points, you need \(100 - points) points more to get the discount" , preferredStyle: .alert)
                buttonAlert.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(buttonAlert, animated: true)
                
            } else {
                
                switch segue {
                case "cheese":
                    performSegue(withIdentifier: "cheese", sender: self)
                case "vegetables":
                    performSegue(withIdentifier: "vegetables", sender: self)
                case "snacks":
                    performSegue(withIdentifier: "snacks", sender: self)
                default:
                    let buttonAlert = UIAlertController(title: "Error!", message: "Click on any button." , preferredStyle: .alert)
                    buttonAlert.addAction(UIAlertAction(title: "Done", style: .default))
                    self.present(buttonAlert, animated: true)
                }
            }
        }
    }
    
    @IBAction func cheeseClicked(_ sender: UIButton) {
        fetchPoints(segue: "cheese")
    }
    
    @IBAction func vegetablesCLicked(_ sender: UIButton) {
        fetchPoints(segue: "vegetables")
    }
    
    @IBAction func snacksClicked(_ sender: UIButton) {
        fetchPoints(segue: "snacks")
    }
    
}
