//
//  ViewController3.swift
//  8
//
//  Created by Вадим Савосько on 07.11.2022.
//

import Foundation
import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didPressBack(_ backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
