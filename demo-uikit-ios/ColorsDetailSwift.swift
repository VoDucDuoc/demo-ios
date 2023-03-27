//
//  ColorsDetail.swift
//  demo-uikit-ios
//
//  Created by DuocVo on 3/27/23.
//

import Foundation
import UIKit

class ColorsDetailSwift: UIViewController{
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .red
    }
}
