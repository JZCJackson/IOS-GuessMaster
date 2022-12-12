//
//  friends.swift
//  Ios1Project
//
//  Created by CHEN on 2022-11-20.
//

import UIKit

class friends: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var friendLabel: UILabel!
    @IBOutlet weak var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        friendsTableView.dataSource = self
        friendsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsTableViewCell
        return cell
    }
}
