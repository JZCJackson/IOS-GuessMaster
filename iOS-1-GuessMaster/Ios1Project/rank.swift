//
//  rank.swift
//  Ios1Project
//
//  Created by CHEN on 2022-11-20.
//

import UIKit
import FirebaseFirestore

class rank: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet weak var rankTableView: UITableView!
    
    let db = Firestore.firestore()
    var count = 0
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        
        rankTableView.dataSource = self
        rankTableView.register(UINib(nibName: "RankTableCell", bundle: nil), forCellReuseIdentifier: "rankTableCell")
        
        loadUsers()
        
    }
    
    func loadUsers() {
        
        db.collection("Users").order(by: "points", descending: true).addSnapshotListener { querySnapshot, error in
            self.users = []
            if error == nil {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        let user = User(charName: (document["charName"] as? String)!,
                                        name: (document["name"] as? String)!,
                                        email: (document["email"] as? String)!,
                                        phone: (document["phone"] as? String)! ,
                                        points: (document["points"] as? Int)!)
                        
                        self.users.append(user)
                        DispatchQueue.main.async {
                            self.rankTableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rankTableView.dequeueReusableCell(withIdentifier: "rankTableCell", for: indexPath) as! RankTableCell
        
        cell.nameLabel.text = users[indexPath.row].name
        cell.pointsLabel.text = "\(users[indexPath.row].points)"
        
        return cell
        
    }
}
