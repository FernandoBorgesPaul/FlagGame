//
//  ViewController.swift
//  Project2
//
//  Created by Fernando Borges Paul on 23/09/19.
//  Copyright © 2019 Fernando Borges Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    
    var score = 0
    var correctAnswer = 0
    var countries = [String]()
    var numberOfTries = 1
    
    
    
    //MARK: - Buttons:
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    @IBOutlet var barButtonScore: UIBarButtonItem!
    
    //MARK: Text Label:
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var attemptLabel: UILabel!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    
        
        countries = ["estonia","france", "germany","ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        
    }
    
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]),for:.normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
            scoreLabel.text = "Score: \(score)"
            numberOfTries += 1
            attemptLabel.text = "Attempt: \(numberOfTries)"
        } else {
            title = "Wrong! The flag you chose was \(countries[sender.tag].uppercased())"
            score -= 1
            scoreLabel.text = "Score: \(score)"
            numberOfTries += 1
            attemptLabel.text = "Attempt: \(numberOfTries)"
        }
        
        
        if(numberOfTries <= 10) {
            
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac,animated: true)
            
        } else {
            
            let finishAlert = UIAlertController(title: "Game Over", message: "Your final Score was \(scoreLabel.text ?? "0")", preferredStyle: .alert)
            
            finishAlert.addAction(UIAlertAction(title: "Start", style: .default, handler: startAgain))
            
            present(finishAlert, animated: true)
            
        }
        
    }
    
    func startAgain(action: UIAlertAction! = nil) {
        
        score = 0
        scoreLabel.text = "\(score)"
        numberOfTries = 1
        attemptLabel.text = "Attempt: 1"
        
        askQuestion()
        
        
    }
    
}

