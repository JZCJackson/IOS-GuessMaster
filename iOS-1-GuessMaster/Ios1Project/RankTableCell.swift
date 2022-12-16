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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
