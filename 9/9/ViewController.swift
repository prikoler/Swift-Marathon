//
//  ViewController.swift
//  9
//
//  Created by Вадим Савосько on 09.11.2022.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func didChangeUser(_ user: UserModel)
}
enum Names: String {
    case anton = "Anton"
    case kolya = "Kolya"
    case vika = "Vika"
    case kirill = "Kirill"
    case vadim = "Vadim"
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate, ViewControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var users: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users.append(UserModel(title: Names.anton.rawValue, age: "18"))
        users.append(UserModel(title: "Anto", age: "18"))
        users.append(UserModel(title: "Ant", age: "18"))
        users.append(UserModel(title: "An", age: "18"))
        users.append(UserModel(title: "A", age: "18"))
        users.append(UserModel(title: "", age: "18"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCustomCell(CustomTableViewCell.self)
        
        let firstUser = users.first
        
        switch firstUser!.job {
        case .someFirstJob:
            return
        case .someSecondJob:
            return
        case .none:
            return
        }
    }
    func didPressAction(for cell: UITableViewCell) {
        
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let model = users[indexPath.row]
            
        performSegue(withIdentifier: "detailIdentifire", sender: model)
        }
    func didChangeUser(_ user: UserModel) {
        if let userValue = users.enumerated().first(where: { $0.element.title == user.title}) {
            
            users.remove(at: userValue.offset)
            users.insert( user, at: userValue.offset)
            
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifire(), for: indexPath) as! CustomTableViewCell

        
        let model  = users[indexPath.row]
//        cell.textLabel?.text = model.title
//        cell.detailTextLabel?.text = model.age
//        cell.imageView?.image = #imageLiteral(resourceName: "Image1")
        
        cell.configure(with: model, delegate: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let model = users[indexPath.row]
//
//        performSegue(withIdentifier: "detailIdentifire", sender: model)
    } 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailIdentifire", let userModel = sender as? UserModel {
            let destController = segue.destination as! DetailViewController
            destController.user = userModel
            destController.delegate = self
        }
    
    }


}
