//
//  TableViewCell.swift
//  finnestWorkSample
//
//  Created by Dominick Hera on 10/10/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(transaction: Transaction) {
        
        self.descriptionLabel.text = transaction.description
        self.amountLabel.text = transaction.amount
        self.dateLabel.text = transaction.date
    }

}
