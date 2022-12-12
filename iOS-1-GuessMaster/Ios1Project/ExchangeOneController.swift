//
//  ExchangeOneController.swift
//  Ios1Project
//
//  Created by CHEN on 2022-12-12.
//

import UIKit

class ExchangeOneController: UIViewController {
    @IBOutlet var code: UILabel!
    @IBOutlet var show: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showCode(_ sender: UIButton) {
        let randomInt = Int.random(in: 0..<999999999)
        code.text = String(randomInt)
        show.isEnabled = false
    }
    
    

}
