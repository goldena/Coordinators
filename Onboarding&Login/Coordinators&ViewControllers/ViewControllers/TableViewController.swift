//
//  TableViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

class TableViewController: CoordinatableViewControllerWithCustomView {

    var tableViewData = [1, 2, 3]
    
    var tableView: TableView {
        guard let tableView = view as? TableView else {
            fatalError("Wrong CustomView type \(ViewType) passed to the controller \(self)")
        }
        
        return tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableView.dataSource = self
        tableView.tableView.delegate = self
    }

}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(tableViewData[indexPath.row])
        
        return cell
    }
    
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            coordinator.show(viewControllerType: LoginViewController.self)
        case 1:
            coordinator.show(viewControllerType: SignupController.self)
        default:
            return
        }
    }
    
}
