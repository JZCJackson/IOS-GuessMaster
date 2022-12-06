//
//  level.swift
//  Ios1Project
//
//  Created by Orange on 2022-11-20.
//

import UIKit

class level: UIViewController {
    @IBOutlet var levelLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        levelLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)

        // Do any additional setup after loading the view.
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
