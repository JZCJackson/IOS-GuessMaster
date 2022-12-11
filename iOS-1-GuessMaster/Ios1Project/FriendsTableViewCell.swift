//
//  TableViewCell.swift
//  Ios1Project
//
//  Created by Fenil Bhanavadiya on 2022-12-02.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var charNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
