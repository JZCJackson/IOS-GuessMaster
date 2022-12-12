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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        
        rankTableView.dataSource = self
        rankTableView.register(UINib(nibName: "RankTableCell", bundle: nil), forCellReuseIdentifier: "rankTableCell")
        
        let userRef = db.collection("Users")
        userRef.order(by: "points", descending: true).addSnapshotListener { quesrySnapshot, error in
            if error == nil {
                if let documents = quesrySnapshot?.documents {
                    for _ in documents {
                        self.count += 1
                    }
                }
                print("===> \(self.count) <====")
                self.rankTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rankTableView.dequeueReusableCell(withIdentifier: "rankTableCell", for: indexPath) as! RankTableCell
        return cell
    }
}
