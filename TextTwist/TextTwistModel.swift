//
//  TextTwistModel.swift
//  TextTwist
//
//  Created by C4Q  on 10/23/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TextTwistModel {
    var randomLettersInfo: TestTwistInfo
    var randomNum = Int(arc4random_uniform(3))
     var randomLetters: String
    init() {
        self.randomLettersInfo = WordData.allInfo[randomNum]
        self.randomLetters = self.randomLettersInfo.letters
    }
    func resetRandomNum() {
        randomNum = Int(arc4random_uniform(3))
        randomLetters = WordData.allInfo[randomNum].letters
        randomLettersInfo = WordData.allInfo[randomNum]
    }
    func removeChar(string: String, anotherStr: String) -> String {
         let char = Character(string)
             var mediaStr = anotherStr
          let index = mediaStr.index(of: char)
        mediaStr.remove(at: index!)
         //  mediaStr.remove(at: mediaStr.index(of: char)!)
             let newStr = String(mediaStr)
              return newStr
        }
    
    func addBackChar(string: String, anotherStr: Character) -> String {
       let newStr = string + String(anotherStr)
        return newStr
    }
    var arrOfCorrectGuess = [""]
    func ifRepeatedGuess(string: String) -> Bool {
        return arrOfCorrectGuess.contains(string)
    }
    func addGuessToArr(string: String) {
        arrOfCorrectGuess.append(string)
        switch string.count {
        case 3:
            score += 3
            arrOfThree.append(string)
        case 4:
            score += 4
            arrOfFour.append(string)
        case 5:
            score += 5
            arrOfFive.append(string)
        default:
            score += 6
            arrOfSix.append(string)
        }
    }
    var arrOfThree = [""]
    var arrOfFour = [""]
    var arrOfFive = [""]
    var arrOfSix = [""]
    var score = 0
}
