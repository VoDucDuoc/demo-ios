//
//  MenuScreenSwift.swift
//  demo-uikit-ios
//
//  Created by DuocVo on 3/31/23.
//

import Foundation
import UIKit

class MenuScreenSwift: UIViewController {
    enum PROJECTS {
        static let colorProject = "Color project"
        static let cardProject = "Card project"
    }
    
    enum Cells {
        static let menuCell = "MenuCell"
    }
    
    enum Segues {
        static let toColorProject = "ToColorProject"
        static let toCardProject = "ToCardProject"
    }
    
    var menuList: [String] = [PROJECTS.colorProject, PROJECTS.cardProject]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
}

extension MenuScreenSwift: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.menuCell) else {
            return UITableViewCell()
        }
        let title = menuList[cellForRowAt.row]
        cell.textLabel?.text = title.uppercased()
        
        let thickness: CGFloat = 1.0
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x:0, y: cell.frame.size.height - thickness, width: cell.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        cell.layer.addSublayer(bottomBorder)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
        let project = menuList[didSelectRowAt.row]
        
        var segues: String = ""
        
        switch project {
        case PROJECTS.colorProject:
            segues = Segues.toColorProject
            break
        case PROJECTS.cardProject:
            segues = Segues.toCardProject
            break
            
        default:
            segues = Segues.toColorProject
        }
        performSegue(withIdentifier: segues, sender: nil)
    }
}
