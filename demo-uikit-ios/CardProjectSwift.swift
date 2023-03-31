//
//  CardProjectSwift.swift
//  demo-uikit-ios
//
//  Created by DuocVo on 3/31/23.
//

import Foundation
import UIKit


class CardProjectSwift : UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var rulesButton: UIButton!
    
    // @IBOutlet var buttons: UIButton! //create outlet collection to style for all button
    
    var timer: Timer!
    var cards: [UIImage] = Desk.allValues
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //        for button in buttons {
        //            button.layer.cornerRadius = 8
        //        }
        
//        stopButton.layer.cornerRadius = 8
//        restartButton.layer.cornerRadius = 8
//        rulesButton.layer.cornerRadius = 8
        
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AH")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
