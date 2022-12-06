//
//  guessViewController.swift
//  Ios1Project
//
//  Created by Orange on 2022-12-05.
//

import UIKit

class guessViewController: UIViewController {

    @IBOutlet weak var displayWordLabel: UILabel!
    @IBOutlet weak var wrongLetters: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    //win or lose
    @IBOutlet weak var gameImage: UIImageView!
    //hangman picture
    @IBOutlet weak var hangmanImage: UIImageView!
    
    //These are the words people will try to guess
    var wordArray = ["ORANGE", "APPLE"]
    
    //This is the chossen word from the wordArray
     var word = ""
    
    //This is where I store the incorrect guesses
    var wrongLettersArray = [Character]()
    
    //This is where I store the letters used in the word
    var usedLetters = [Character]()
    
    //This is where I display letters and question marks of the word trying to be guessed
    var displayWordArray = [Character]()
    
    //This is the string I display for the user to guess
    var displayWord = ""
    
    //This is the character that the user guesses
    var guess: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessTextField.layer.borderColor = UIColor.init(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0, alpha:1.0).cgColor
        guessTextField.layer.borderWidth = 3.0
        guessTextField.attributedPlaceholder = NSAttributedString(
            string: "Guess Words",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        guessTextField.layer.cornerRadius = 15.0
        //choose the word and assign to variable word
        word = wordArray .randomElement()!
        
        usedLetters = Array(word)
        
        //set displayWord to the right number of question marks and put into diaplay word label
        for letters in 1...word.count {
            displayWord += "?"
            displayWordLabel.text = displayWord
            displayWordArray = Array(displayWord)
        }
        
    }

    @IBAction func guessButton(_ sender: UIButton) {
        //Resign first responder textField
        guessTextField.resignFirstResponder()
        
        //Make sure the user has entered a letter but only one letter
        let guess1 = guessTextField.text
        if guess1 == ""{
            guessTextField.placeholder = "Can not be empty"
        }else if guess1!.count > 1{
            guessTextField.placeholder = "Please enter one letter"
        }else{
            //make every input be capital
            guess = Character(guessTextField.text!.capitalized)
            //Call the check for letter function
            checkForLetter()
            displayWord = String(displayWordArray)
            displayWordLabel.text = displayWord
            guessTextField.text = ""
            checkForWin()
            
        }
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        //Reset the variables, the labels, the images
        guessTextField.text = ""
        //image blank at start
        hangmanImage.image = UIImage(contentsOfFile: "")
        gameImage.image = UIImage(contentsOfFile: "")
        wrongLettersArray = []
        wrongLetters.text = ""
        displayWord = ""

        //Pick a new random word and display it in the label
        word = wordArray.randomElement()!
        usedLetters = Array(word)
        
        for letters in 1...word.count{
            displayWord += "?"
            displayWordLabel.text = displayWord
            displayWordArray = Array(displayWord)
        }
        
    }
    
    func checkForLetter(){
        if usedLetters.contains(guess) {
            //correct guess then display that letter
            for i in 0...word.count - 1 {
                if guess == usedLetters[i] {
                    displayWordArray[i] = guess
                }
            }
            
        }else {
            //draw hangman
            wrongLettersArray.append(guess)
            wrongLetters.text = String(wrongLettersArray)
        }
    }

    func placeImage(){
        //
        let p0 = UIImage(named: "pic0")
        let p1 = UIImage(named: "pic1")
        let p2 = UIImage(named: "pic2")
        let p3 = UIImage(named: "pic3")
        let p4 = UIImage(named: "pic4")
        let p5 = UIImage(named: "pic5")
        let p6 = UIImage(named: "pic6")
        let p7 = UIImage(named: "pic7")
        let p8 = UIImage(named: "pic8")
        let p9 = UIImage(named: "pic9")

        
        let imageArray = [p0,p1,p2,p3,p4,p5,p6,p7,p8,p9]
        if wrongLettersArray == [] {
            hangmanImage.image = imageArray[0]
        }else{
            hangmanImage.image = imageArray[wrongLettersArray.count]
        }
        
    }
    
    func checkForWin(){

        if wrongLettersArray.count == 9 {

            gameImage.image = UIImage(named: "gameOver")

        } else if displayWord.contains("?") {

            placeImage()
        }else {
            gameImage.image = UIImage(named: "youWin")
        }
    }
    
}
