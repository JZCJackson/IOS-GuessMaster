//
//  RankTableCell.swift
//  Ios1Project
//
//  Created by Fenil Bhanavadiya on 2022-12-11.
//

import UIKit
import FirebaseFirestore

class RankTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    let db = Firestore.firestore()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        listAllUser()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func listAllUser() {
        let userRef = db.collection("Users")
        userRef.order(by: "points", descending: true).addSnapshotListener { quesrySnapshot, error in
            if error == nil {
                if let documents = quesrySnapshot?.documents {
                    for document in documents {
                        self.nameLabel.text = document["name"] as? String
                        self.pointsLabel.text = String((document["points"] as? Int)!)
                        print(document["points"]!)
                    }
                }
            }
        }
    }
    
}
