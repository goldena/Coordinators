//
//  TableView.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

class TableView: CustomView {

    lazy var tableView: UITableView = {
        UITableView(CellClass: UITableViewCell.self, cellReuseIdentifier: "cell", addTo: self)
    }()
    
    override func setupView() {
        tableView.rowHeight = 100
    }
    
    override func setupLayout() {
        tableView.leading(to: .safeArea).padding(50)
        tableView.trailing(to: .safeArea)
        tableView.top(to: .safeArea)
        tableView.bottom(to: .bounds)
    }
    
}
