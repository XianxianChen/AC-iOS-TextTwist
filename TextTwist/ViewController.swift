//
//  ViewController.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var instruLabel: UILabel!
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var textViewOne: UITextView!
    @IBOutlet weak var textViewTwo: UITextView!
    @IBOutlet weak var textView3: UITextView!
    @IBOutlet weak var textView4: UITextView!
    var model = TextTwistModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        guessTextField.delegate = self
        displayLabel.text = model.randomLetters
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        
        if model.randomLettersInfo.words.contains(text) {
            self.instruLabel.text = "Correct!"
            if model.ifRepeatedGuess(string: text) == false {
                model.addGuessToArr(string: text)
            } else {
                self.instruLabel.text = "\(text) already guessed"
            }
            self.scoreLabel.text = "Current Score: \(model.score)"
            
            switch text.count {
            case 3:
                textViewOne.text = model.arrOfThree.joined(separator: "\n")
                textViewOne.backgroundColor = .green
            case 4:
                textViewTwo.text = model.arrOfFour.joined(separator: "\n")
                textViewTwo.backgroundColor = .yellow
            case 5:
                textView3.text = model.arrOfFive.joined(separator: "\n")
                textView3.backgroundColor = .orange
            default:
                self.instruLabel.text = "Goodjob! Now guess new word"
                textView4.text = model.arrOfSix.joined(separator: "\n")
                textView4.backgroundColor = .red
                model.resetRandomNum()
//                self.viewDidLoad()
            }
            
        } else {
            self.instruLabel.text = "Wrong! Try again"
            
        }
        textField.text = ""
        textField.resignFirstResponder()
        newGuess()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(range.lowerBound, range.upperBound, string)
        
//        guard displayLabel.text!.count > 0 else {
//            return false
//        }
        
        if let currentText = displayLabel.text {
        if string == "" && string.count == 0 && range.upperBound - range.lowerBound == 1 {
            displayLabel.text = model.addBackChar(string: currentText, anotherStr: textField.text!.last!)
            return true
        }
            
        guard currentText.contains(string) else {
            instruLabel.text = "You can't add \(string)"
            return false
        }
        
        guard currentText.count > 0 && string.count == 1 else {
            return false
        }
        var currentLabelStr = displayLabel.text!
        currentLabelStr = model.removeChar(string: string, anotherStr: currentLabelStr)
        displayLabel.text = currentLabelStr
        }
        
        return true
        
    }
    
    func newGuess() {
       displayLabel.text = model.randomLetters
    }
  
    
}

