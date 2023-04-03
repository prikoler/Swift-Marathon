//
//  CustomTableViewCell.swift
//  9
//
//  Created by Вадим Савосько on 10.11.2022.
//

import UIKit

protocol CustomCell {
    static func cellNib () -> UINib?
    
    static func cellIdentifire() -> String
}

protocol CustomCellDelegate: AnyObject {
    func didPressAction (for cell: UITableViewCell)
}

class CustomTableViewCell: UITableViewCell, CustomCell {


    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!

    weak var delegate: CustomCellDelegate?
    
    func configure(with user: UserModel, delegate: CustomCellDelegate) {
        labelOne.text = user.age
        labelTwo.text = user.title
        
        self.delegate = delegate
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifire() -> String {
        return String(describing: self)
    }

    @IBAction func buttonAction(_ sender: Any) {
        delegate?.didPressAction(for: self)
    }
}
