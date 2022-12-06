//
//  guess.swift
//  Ios1Project
//
//  Created by Orange on 2022-11-20.
//

import UIKit

class guess: UIViewController {

    @IBOutlet var guessLabel: UILabel!
    @IBOutlet var guessEdit: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        guessLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)

        guessEdit.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        guessEdit.layer.borderWidth = 3.0
        guessEdit.attributedPlaceholder = NSAttributedString(
            string: "Guessing Words",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        guessEdit.layer.cornerRadius = 15.0

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
