//
//  CardVC.swift
//  card-gym
//
//  Created by DuocVo on 3/31/23.
//

import UIKit

class CardVC: UIViewController {
  
  let cardImageView = UIImageView()
  
  //    let images =
  
  let stopButton = CWButton(backgroundColor: .systemPink, title: "Stop!", systemImageName: "stop.circle")
  let resetButton = CWButton(backgroundColor: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise.circle")
  let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules", systemImageName: "list.bullet")
  
  var cards: [UIImage] = Desk.allValues
  var timer: Timer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    configureUI()
    startTimer()
  }
  
  func startTimer() {
//    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(randomImage), userInfo: nil, repeats: true)
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {_ in
      self.randomImage()
    }
  }
  
  @objc func randomImage() {
    cardImageView.image = cards.randomElement()
  }
  
  @objc func stopButtonTapped() {
    timer.invalidate()
  }
  
  @objc func resetButtonTapped() {
    timer.invalidate()
    startTimer()
  }
  
  func configureUI() {
    configureCardImageView()
    configureStopButton()
    configureResetButton()
    configureRulesButton()
    
  }
  
  func configureCardImageView(){
    view.addSubview(cardImageView)
    cardImageView.translatesAutoresizingMaskIntoConstraints = false
    cardImageView.image = UIImage(named: "AH")
    
    NSLayoutConstraint.activate([
      cardImageView.widthAnchor.constraint(equalToConstant: 250),
      cardImageView.heightAnchor.constraint(equalToConstant: 350),
      cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
    ])
    
  }
  
  func configureStopButton(){
    view.addSubview(stopButton)
    stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      stopButton.widthAnchor.constraint(equalToConstant: 260),
      stopButton.heightAnchor.constraint(equalToConstant: 50),
      stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
    ])
  }
  
  func configureResetButton(){
    view.addSubview(resetButton)
    resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      resetButton.widthAnchor.constraint(equalToConstant: 115),
      resetButton.heightAnchor.constraint(equalToConstant: 50),
      resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
      resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
    ])
  }
  
  func configureRulesButton(){
    view.addSubview(rulesButton)
    rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      rulesButton.widthAnchor.constraint(equalToConstant: 115),
      rulesButton.heightAnchor.constraint(equalToConstant: 50),
      rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
      rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
    ])
  }
  
  @objc func presentRulesVC(){
    let rulesVC = RulesVC()
    //        rulesVC.textHello = "Hello"
    present(rulesVC, animated: true)
  }
  
}
