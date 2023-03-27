//
//  ColorsTable.swift
//  demo-uikit-ios
//
//  Created by DuocVo on 3/27/23.
//

import Foundation
import UIKit

class ColorsTable: UIViewController {
    
    var colors: [UIColor] = []
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    enum Segues {
        static let toDetail = "ToColorsDetail"
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        addRandomColors()
    }
    
    func addRandomColors() {
        for _ in 0...20 {
            colors.append(.randomColor())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ColorsDetailSwift
        dest.color = sender as? UIColor
    }
}

extension ColorsTable: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        let color = colors[cellForRowAt.row]
        cell.backgroundColor = color

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
        let color = colors[didSelectRowAt.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
}
