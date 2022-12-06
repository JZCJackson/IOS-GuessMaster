//
//  home.swift
//  Ios1Project
//
//  Created by Orange on 2022-11-20.
//

import UIKit
import FirebaseFirestore

class home: UIViewController {
    @IBOutlet var homeLabel: UILabel!
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        // Do any additional setup after loading the view.
        
        loadUserData()
    }
    
    func loadUserData() {
        
        db.collection("Users").getDocuments { querySnapShot, error in
            if let e = error {
                print("Error in fetching data ---> \(e)")
            } else {
                if let snapShotDocument = querySnapShot?.documents {
                    for doc in snapShotDocument {
                        let data = doc.data()
                        print(data)
                    }
                }
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
