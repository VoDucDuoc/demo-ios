//
//  CWButton.swift
//  card-gym
//
//  Created by DuocVo on 3/31/23.
//

import UIKit

class CWButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(backgroundColor: UIColor, title: String, systemImageName: String){
    super.init(frame: .zero)
    
    configuration = .tinted()
    configuration?.baseForegroundColor = backgroundColor
    configuration?.baseBackgroundColor = backgroundColor
    configuration?.cornerStyle = .medium
    configuration?.title = title
    
    configuration?.image = UIImage(systemName: systemImageName)
    configuration?.imagePadding = 5
    configuration?.imagePlacement = .leading
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
