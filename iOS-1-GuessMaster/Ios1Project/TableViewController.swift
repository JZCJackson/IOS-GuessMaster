//
//  TableViewController.swift
//  Ios1Project
//
//  Created by Fenil Bhanavadiya on 2022-12-11.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.dataSource = self
        friendsTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! TableViewCell
        return cell
    }

}
