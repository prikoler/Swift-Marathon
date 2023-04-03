//
//  TableViewExtention.swift
//  9
//
//  Created by Вадим Савосько on 10.11.2022.
//

import Foundation
import UIKit

extension UITableView {
    func registerCustomCell(_ cell: CustomCell.Type) {
        self.register(cell.cellNib(), forCellReuseIdentifier: cell.cellIdentifire())
    }
}
