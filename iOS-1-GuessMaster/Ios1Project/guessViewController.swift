//
//  guessViewController.swift
//  Ios1Project
//
//  Created by CHEN on 2022-12-05.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class guessViewController: UIViewController {
    
    @IBOutlet weak var showWordLabel: UILabel!
    @IBOutlet weak var wrongGuess: UILabel!
    @IBOutlet weak var guessLetter: UITextField!
    //win or lose
    @IBOutlet weak var result: UIImageView!
    //hangman picture
    @IBOutlet weak var hangmanImage: UIImageView!
    
    let db = Firestore.firestore()
    
    var ref = Database.database().reference()
    //var currentRef: DatabaseReference!
    
    //These are the words people will try to guess
    var database = ["ORANGE", "APPLE"]
    
    //This is the chossen word from the database
    var word = ""
    
    //This is where I store the incorrect guesses
    var wrongGuessArray = [Character]()
    
    //This is where I store the letters used in the word
    var usedLetters = [Character]()
    
    //This is where I display letters and question marks of the word trying to be guessed
    var showdatabase = [Character]()
    
    //This is the string I display for the user to guess
    var showWord = ""
    
    //This is the character that the user guesses
    var guess: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetter.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        guessLetter.layer.borderWidth = 3.0
        guessLetter.attributedPlaceholder = NSAttributedString(
            string: "Guess Words",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        guessLetter.layer.cornerRadius = 15.0
        //choose the word and assign to variable word
        word = database .randomElement()!
        
        usedLetters = Array(word)
        
        // MARK: set right number of question marks to showWord
        for _ in 1...word.count {
            showWord += "?"
            showWordLabel.text = showWord
            showdatabase = Array(showWord)
        }
        
    }
    
    @IBAction func guessAction(_ sender: UIButton) {
        //Resign first responder textField
        guessLetter.resignFirstResponder()
        
        //Make sure the user has entered a letter but only one letter
        let guess1 = guessLetter.text
        if guess1 == ""{
            guessLetter.placeholder = "Can not be empty"
        }else if guess1!.count > 1{
            guessLetter.placeholder = "Please enter one letter"
        }else{
            //make every input be capital
            guess = Character(guessLetter.text!.capitalized)
            // MARK: Call the check for letter function
            if usedLetters.contains(guess) {
                //correct guess then display that letter
                for i in 0...word.count - 1 {
                    if guess == usedLetters[i] {
                        showdatabase[i] = guess
                    }
                }
                
            }else {
                //draw hangman
                wrongGuessArray.append(guess)
                wrongGuess.text = String(wrongGuessArray)
            }
            showWord = String(showdatabase)
            showWordLabel.text = showWord
            guessLetter.text = ""
            // MARK: check user win or not
            if wrongGuessArray.count == 10 {
                result.image = UIImage(named: "gameOver")
            } else if showWord.contains("?") {
                showImage()
            }else {
                result.image = UIImage(named: "youWin")
                increasePoints()
            }
        }
    }
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        // MARK: Reset variables, labels and images
        guessLetter.text = ""
        //image blank at start
        hangmanImage.image = UIImage(contentsOfFile: "")
        result.image = UIImage(contentsOfFile: "")
        wrongGuessArray = []
        wrongGuess.text = ""
        showWord = ""
        
        //Pick a new random word
        word = database.randomElement()!
        usedLetters = Array(word)
        
        for _ in 1...word.count{
            showWord += "?"
            showWordLabel.text = showWord
            showdatabase = Array(showWord)
        }
        
    }
    
    
    
    func showImage(){
        // MARK: show the different inamges when the user guess wrong
        let image0 = UIImage(named: "pic0")
        let image1 = UIImage(named: "pic1")
        let image2 = UIImage(named: "pic2")
        let image3 = UIImage(named: "pic3")
        let image4 = UIImage(named: "pic4")
        let image5 = UIImage(named: "pic5")
        let image6 = UIImage(named: "pic6")
        let image7 = UIImage(named: "pic7")
        let image8 = UIImage(named: "pic8")
        let image9 = UIImage(named: "pic9")
        
        let images = [image0,image1,image2,image3,image4,image5,image6,image7,image8,image9]
        if wrongGuessArray == [] {
            hangmanImage.image = images[0]
        }else{
            hangmanImage.image = images[wrongGuessArray.count]
        }
        
    }
    
    // MARK:  method for updating the points
    func increasePoints() {
        
        // getting logged in user data
        let user = Auth.auth().currentUser
        var email: String?
        if let currentUser = user {
            email = currentUser.value(forKey: "email") as? String
        }
        
        // updating points when guess is correct
        let documents = db.collection("Users").whereField("email", isEqualTo: email!)
        documents.getDocuments { querySnapshot, error in
            if let err = error {
                print("There is an error --- \(err)")
            } else{
                if let users = querySnapshot?.documents {
                    for user in users {
                        print("------->\(user.documentID)")
                        let points = user["points"] as? Int
                        if var oldPoint = points {
                            oldPoint = oldPoint + 5
                            print(oldPoint)
                            self.db.collection("Users").document(user.documentID).setData(["points" : oldPoint], merge: true)
                        }
                    }
                }
            }
        }
    }
}
