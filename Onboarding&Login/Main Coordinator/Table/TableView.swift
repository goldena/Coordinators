//
//  TableView.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

class TableView: CustomView {

    lazy var tableView: UITableView = {
        makeTableView(CellClass: UITableViewCell.self, cellReuseIdentifier: "cell", addTo: self)
    }()
    
    override func setupViews() {
        super.setupViews()
        
        tableView.rowHeight = 100
    }
    
    override func setupLayout() {
        super.setupLayout()

        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).activate()
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).activate()
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).activate()
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
    }

    override func render() {
        super.render()
        
        tableView.reloadData()
    }
    
}
