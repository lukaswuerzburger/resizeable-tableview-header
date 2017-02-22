//
//  ViewController.swift
//  tableview-header
//
//  Created by Lukas Würzburger on 2/22/17.
//  Copyright © 2017 Lukas Würzburger. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "AAA"
        return cell
    }
}

