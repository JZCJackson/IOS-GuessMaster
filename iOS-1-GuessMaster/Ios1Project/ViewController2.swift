//
//  ViewController2.swift
//  Ios1Project
//
//  Created by Orange on 2022-11-18.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController2: UIViewController {
    
    @IBOutlet var registerLabel: UILabel!
    @IBOutlet var nameEdit: UITextField!
    @IBOutlet var emailEdit: UITextField!
    @IBOutlet var phoneEdit: UITextField!
    @IBOutlet var passwordEdit: UITextField!
    @IBOutlet var confirmEdit: UITextField!
    
    var points: Int = 0
    var charName: String = "Great Adventurer"
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        nameEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        nameEdit.layer.borderWidth = 3.0
        nameEdit.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        nameEdit.layer.cornerRadius = 15.0
        
        emailEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        emailEdit.layer.borderWidth = 3.0
        emailEdit.attributedPlaceholder = NSAttributedString(
            string: "E-mail",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        emailEdit.layer.cornerRadius = 15.0
        
        phoneEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        phoneEdit.layer.borderWidth = 3.0
        phoneEdit.attributedPlaceholder = NSAttributedString(
            string: "Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        phoneEdit.layer.cornerRadius = 15.0
        
        passwordEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        passwordEdit.layer.borderWidth = 3.0
        passwordEdit.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        passwordEdit.layer.cornerRadius = 15.0
        
        confirmEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        confirmEdit.layer.borderWidth = 3.0
        confirmEdit.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        confirmEdit.layer.cornerRadius = 15.0
    }

    @IBAction func registerClicked(_ sender: UIButton) {
        
        if let name = nameEdit.text, let email = emailEdit.text, let phone = phoneEdit.text, let password = passwordEdit.text, let confPassword = confirmEdit.text {
            
            if password == confPassword {
                
                // creating a new user
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        print(e)
                    } else {
                        self.performSegue(withIdentifier: "RegToLogin", sender: self)
                    }
                }
                
                // creating a users collection and saving user's data
                db.collection("Users").addDocument(data: [
                    "charName": charName,
                    "name": name,
                    "email": email,
                    "phone": phone,
                    "points": points
                ]) { (error) in
                    if let e = error {
                        print(e)
                    } else {
                        print("Data saved successfully.")
                    }
                }
                
            } else {
                print("Password Mismatch")
            }
            
        }
        
    }
}
