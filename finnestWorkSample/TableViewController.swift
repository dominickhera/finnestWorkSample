//
//  TableViewController.swift
//  finnestWorkSample
//
//  Created by Dominick Hera on 10/10/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TransactionManager.shared.initTransactionList() { error in
            self.tableView.reloadData()
        }
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TransactionManager.shared.tranactionList.count
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            TransactionManager.shared.getNextNTranscations() { error in
            self.tableView.reloadData()
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let Transaction = TransactionManager.shared.tranactionList[indexPath.row]
        cell.configureCell(transaction: Transaction)

        return cell
    }

}
