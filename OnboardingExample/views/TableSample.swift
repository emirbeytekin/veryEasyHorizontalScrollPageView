//
//  TableSample.swift
//  OnboardingExample
//
//  Created by Emir Beytekin on 1/29/19.
//  Copyright © 2019 Anitaa. All rights reserved.
//

import UIKit

class TableSample: UIView {
    @IBOutlet weak var tableView: UITableView!
    var tableElementArray = [""]
    var tableIndex = 0
    
}
extension TableSample: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tableElementArray[indexPath.row] 
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableElementArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableIndex == 0 {
            print("index 0")
        } else {
            print("diğerleri")
        }
    }
}
