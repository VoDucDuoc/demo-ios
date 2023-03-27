//
//  SytaxSwift.swift
//  demo-uikit-ios
//
//  Created by DuocVo on 3/27/23.
//

import Foundation
import UIKit

class SytaxSwift: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        self.printHello()
        
        //ARRAY
        var ages = [1,2,3,4,5]
        Swift.print(ages)
        Swift.print(ages.last ?? 0)
        Swift.print(ages.count)
        Swift.print(ages[0])
        ages.append(10)
        ages.insert(11, at: 0)
        ages.sort()
        Swift.print("the oldest is \(ages.last ?? 99)")
        ages.reverse()
        ages.shuffle()
        Swift.print(ages)
        
        //SET
        let list = [2,4,6,8,4]
        //        var listSet: Set<Int> = []
        let listSet = Set(list)
        Swift.print(listSet)
        Swift.print(listSet.contains(100))
        
        //DICTIONARY
        let _: [String: String] = [
            "phone": "iPhone X",
            "laptop": "macbook"
        ]
        
        //FUNCTION
        self.print(text: "hello world")
        let sumResult = self.sum(firstNum: 5, secondNum: 5)
        Swift.print(sumResult)
        
        //LOOP
        let allStars = ["duocvo", "duoc.vo", "UC"]
        for player in allStars {
            Swift.print(player)
        }
        for i in 0...5{
            Swift.print(i)
            let randomNumber = Int.random(in: 0...100)
            Swift.print(randomNumber)
        }
        
        //ENUM
        enum Phone {
            case iPhone13
            case iPhone14
        }
        
        enum TV: String {
            case LG = "LG 55 Inch"
            case SAMSUNG = "SS 65 Inch"
        }
        func getMyOpinion(phone: Phone){
            if(phone == .iPhone13){
                Swift.print(phone)
            }
        }
        func getMyOpinionTV(tv: TV){
            Swift.print(tv.rawValue)
        }
        getMyOpinion(phone: .iPhone13)
        getMyOpinionTV(tv: .LG)
        
        //SWITCH CASE
        let matchmakingRank = 50
        determinePlayerLeague(rank: matchmakingRank)
        
        //GUARD STATEMENT
        func getOldestAge(){
            guard let oldestAge = ages.last else {
                return
            }
        }
        
        //CLASS
        class Developer {
            var name: String
            var jobTitle: String
            var yearsExp: Int?
            
            init(name: String, jobTitle: String, yearsExp: Int){
                self.name = name
                self.jobTitle = jobTitle
                self.yearsExp = yearsExp
            }
        }
        let duocvo = Developer(name: "DuocVo", jobTitle: "Developer", yearsExp: 2)
        
        
    }
    func printHello(){
        Swift.print("Hello Swift")
    }
    func print(text: String){
        Swift.print(text)
    }
    func sum(firstNum: Int, secondNum: Int) -> Int {
        return firstNum + secondNum
    }
    func determinePlayerLeague(rank: Int){
        switch rank {
        case 0:
            do {
                Swift.print("play the game to determine your league")
            }
        case 1..<50:
            do {
                Swift.print("You are in BRONZE")
            }
        case 50..<100:
            do {
                Swift.print("You are in SILVER")
            }
        case 100..<200:
            do {
                Swift.print("You are in GOLD")
            }
        default:
            Swift.print("do not see you")
        }
    }
}
