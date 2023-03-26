//
//  GuessView.swift
//  Ios1Project
//
//  Created by Orange on 2023-03-18.
//

import SwiftUI
//import FirebaseAuth
//import FirebaseFirestore
//import FirebaseDatabase

struct GuessView: View {
    @State private var showWordLabel = ""
    @State private var wrongGuess = ""
    @State private var guessLetter = ""
    @State private var resultImage: UIImage?
    @State private var hangmanImage: UIImage?
    @State private var guessPlaceholder = "Guess Words"
    
    
    //    let db = Firestore.firestore()
    //    var ref = Database.database().reference()
    
    let database = ["ORANGE", "APPLE"]
    @State private var word = ""
    @State private var wrongGuessArray = [Character]()
    @State private var usedLetters = [Character]()
    @State private var showDatabase = [Character]()
    @State private var showWord = ""
    @State private var guess: Character!
    
    init() {
        word = database.randomElement()!
        createMaskedWord()
        hangmanImage = UIImage(named: "pic0")
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Image(uiImage: hangmanImage ?? UIImage(named: "pic0")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                
                Image(uiImage: resultImage ?? UIImage(named: "pic0")!)
                    .resizable()
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.5)
                    .frame(height: UIScreen.main.bounds.height * 0.1)
                
                
                Text(showWordLabel)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    
                
                Text(wrongGuess)
                    .padding()
                    .foregroundColor(.red)
                
                ZStack(alignment: .leading) {
                    if guessLetter.isEmpty {
                        Text(guessPlaceholder)
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                    }
                    TextField("", text: $guessLetter)
                        .padding()
                        .foregroundColor(.white)
                        .frame(height: UIScreen.main.bounds.height * 0.05)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0), lineWidth: 3)
                        )
                }
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width * 0.5)


                
                HStack {
                    Button(action: guessAction) {
                        Text("Guess")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.horizontal, 20) // Add 20 points of horizontal padding
                            .foregroundColor(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                    }
                    
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.1) // Set width to 10 points
                    
                    Button(action: resetAction) {
                        Text("Reset")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.horizontal, 20) // Add 20 points of horizontal padding
                            .foregroundColor(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: setupGame)
    }
    
    
    func guessAction() {
        let guess1 = guessLetter
            if guess1 == "" {
                guessPlaceholder = "Can not be empty"
            } else if guess1.count > 1 {
                guessPlaceholder = "Please enter one letter"
                guessLetter = ""
            } else {
            guess = Character(guessLetter.uppercased())
            
                if usedLetters.contains(guess) {
                    for i in 0...word.count - 1 {
                        if guess == usedLetters[i] {
                            showDatabase[i] = guess
                        }
                    }
                } else {
                    wrongGuessArray.append(guess)
                    wrongGuess = String(wrongGuessArray)
                }
                showWordLabel = String(showDatabase)
                guessLetter = ""
                
                if wrongGuessArray.count == 10 {
                    resultImage = UIImage(named: "gameOver")
                } else if !showWordLabel.contains("?") {
                    resultImage = UIImage(named: "youWin")
                    increasePoints()
                } else {
                    showImage()
                }
                
            }
    }
    
    
    func resetAction() {
        guessLetter = ""
        hangmanImage = UIImage(named: "pic0")
        resultImage = nil
        wrongGuessArray = []
        wrongGuess = ""
        showWordLabel = ""

        word = database.randomElement()!
        usedLetters = Array(word)

        for _ in 1...word.count {
            showWordLabel += "?"
            showDatabase = Array(showWordLabel)
        }
    }
        
    func showImage() {
        // MARK: show the different images when the user guess wrong
        hangmanImage = UIImage(named: "pic\(wrongGuessArray.count)")
    }
    
    func increasePoints() {
        // Update the points
    }
    
    func createMaskedWord() {
        showWordLabel = String(repeating: "?", count: word.count)
        showDatabase = Array(showWordLabel)
    }
    
    func setupGame() {
        word = database.randomElement()!
        usedLetters = Array(word)
        createMaskedWord()
        hangmanImage = UIImage(named: "pic0")
    }
}




struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView()
    }
}
