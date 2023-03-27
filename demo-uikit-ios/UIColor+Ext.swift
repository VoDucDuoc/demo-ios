//
//  UIColor.swift
//  demo-uikit-ios
//
//  Created by DuocVo on 3/27/23.
//

import Foundation
import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
        return randomColor
    }
}
