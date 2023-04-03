//
//  DetailViewController.swift
//  9
//
//  Created by Вадим Савосько on 10.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    
    var user: UserModel!
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = user?.title
        ageLabel.text = user?.age
        
        nameLabel.sizeToFit()
        ageLabel.sizeToFit()
        
        changeData()
    }
    
    private func changeData() {
        guard let ageInt = Int(user.age) else {return}
        
        user.age = String(ageInt + 22)
        
        delegate?.didChangeUser(user)
    }

}
