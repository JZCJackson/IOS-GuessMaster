//
//  friends.swift
//  Ios1Project
//
//  Created by CHEN on 2022-11-20.
//

import UIKit
import FirebaseFirestore

class friends: UIViewController {
    
    @IBOutlet var friendLabel: UILabel!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    let db = Firestore.firestore()
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        
        loadFriends()
        
        friendsCollectionView.delegate = self
        friendsCollectionView.dataSource = self
        
    }
    
    func loadFriends() {
        
        db.collection("Users").getDocuments { querySnapshot, error in
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
                            self.friendsCollectionView.reloadData()
                        }
                    }
                }
            }
        }
        
    }
}

extension friends: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(users.count)
        
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = friendsCollectionView.dequeueReusableCell(withReuseIdentifier: "reusableCell", for: indexPath) as! FriendsCollectionViewCell
        
        print(users[indexPath.row].name)
        cell.nameLabel.text = users[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
