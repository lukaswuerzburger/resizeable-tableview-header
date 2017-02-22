//
//  DetailViewController.swift
//  tableview-header
//
//  Created by Lukas Würzburger on 2/22/17.
//  Copyright © 2017 Lukas Würzburger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IB Outlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!

    // MARK: - Variables

    let topViewMinHeight: CGFloat = 100
    let topViewMaxHeight: CGFloat = 150

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false

        tableView.contentInset = UIEdgeInsets(top: topViewHeightConstraint.constant, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let navigationController = navigationController {
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
//            navigationController.navigationBar.isTranslucent = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let navigationController = navigationController {
            navigationController.navigationBar.setBackgroundImage(nil, for: .default)
            navigationController.navigationBar.shadowImage = nil
//            navigationController.navigationBar.isTranslucent = false
        }
    }

    // MARK: - Table View

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "AAA"
        return cell
    }

    // MARK: - Scroll View

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let yOffset = scrollView.contentOffset.y
        if yOffset < -topViewMaxHeight {
            topViewHeightConstraint.constant = topViewMaxHeight
        } else if yOffset < -topViewMinHeight {
            topViewHeightConstraint.constant = yOffset * -1
        } else {
            topViewHeightConstraint.constant = topViewMinHeight
        }
    }
}
