//
//  ViewController.swift
//  Ios1Project
//
//  Created by Orange on 2022-11-18.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var userEdit: UITextField!
    @IBOutlet var passwordEdit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        //userNameLabel.layer.borderColor = UIColor.purple.cgColor
//        userNameLabel.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        userEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        userEdit.layer.borderWidth = 3.0
        userEdit.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        userEdit.layer.cornerRadius = 15.0

        passwordEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        passwordEdit.layer.borderWidth = 3.0
        passwordEdit.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        passwordEdit.layer.cornerRadius = 15.0
    }
    
    // login button click action
    @IBAction func loginCLicked(_ sender: UIButton) {
        // collectiong user entered credentials
        if let email = userEdit.text, let password = passwordEdit.text {
            // logging user in with given creadentials
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    // taking the authenticated user to another screen
                    self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
            }
        }
    }
}
