//
//  ViewController.swift
//  Number gusser
//
//  Created by Hajar Alomari on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {
    // declare UI element
    @IBOutlet weak var hiddenNumber: UILabel!
    @IBOutlet weak var hiddenBox: UIImageView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var attempsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var attemptView: UIView!
    @IBOutlet weak var guessBtn: UIButton!
    @IBOutlet weak var replayBtn: UIButton!
    
    // declare variables
    var attempts = 3
    var score = 0
    var randomHiddenNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // rounded corners
        scoreView.layer.cornerRadius = 15
        scoreView.layer.masksToBounds = true
        
        attemptView.layer.cornerRadius = 15
        attemptView.layer.masksToBounds = true
        
        inputField.layer.cornerRadius = 25
        inputField.layer.masksToBounds = true
        
        guessBtn.layer.cornerRadius = 25
        guessBtn.layer.masksToBounds = true
        
        replayBtn.layer.cornerRadius = 15
        replayBtn.layer.masksToBounds = true
        
        randomHiddenNumber = startGame()
        
        
    }
    
    //buttons Actions
    
    @IBAction func guessBtn(_ sender: UIButton) {
        setGame(randomNumber: randomHiddenNumber)
    }
    
    
    @IBAction func replayBtn(_ sender: UIButton) {
        randomHiddenNumber =  startGame()
    }
    
    
    
    // functions
    
    func setGame(randomNumber : Int){
        
        
        
       
       // (myString as NSString).doubleValue
        
        let inputValue = inputField.text
        let guessedNumber = (inputValue! as NSString).integerValue
        if attempts > 0{
        if randomNumber == guessedNumber {
            resultLabel.text = "Congrats! the number is \(randomNumber)"
            hiddenBox.isHidden = true
            score += 1
            scoreLabel.text = "Score = \(score)"
            guessBtn.isEnabled = false
            
        } else if  randomNumber > guessedNumber{
           
            resultLabel.text = "\(guessedNumber) is too low"
            attempts -= 1
            attempsLabel.text = "attempts: \(attempts)"
            
        } else if randomNumber < guessedNumber {
            resultLabel.text = "\(guessedNumber) is too high"
            attempts -= 1
            attempsLabel.text = "attempts: \(attempts)"
        }
        } else{
            resultLabel.text = "You Lost! the number is \(randomNumber)"
            inputField.isEnabled = false
            guessBtn.isEnabled = false
            hiddenBox.isHidden = true
        }
    }
    
    //func to start game
    func startGame() -> Int{
        let rangeStart = 0
        let rangeEnd = 5
        let randomNumber = Int.random(in: rangeStart...rangeEnd)
        hiddenNumber.text = String(randomNumber)
        instructionLabel.text = "Guess a  number between \(rangeStart) and \(rangeEnd)"
        inputField.isEnabled = true
        guessBtn.isEnabled = true
        hiddenBox.isHidden = false
        attempts = 3
        attempsLabel.text = "attempts: \(attempts)"
        resultLabel.text = ""
        
        return randomNumber
    }
}

