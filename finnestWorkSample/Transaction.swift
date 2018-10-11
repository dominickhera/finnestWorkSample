//
//  Transaction.swift
//  finnestWorkSample
//
//  Created by Dominick Hera on 10/10/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import Foundation

struct Transaction {
    let description: String
    let amount: String
    let date: String
    
    init(description: String, amount: String, date: String) {
        self.description = description
        self.amount = amount
        self.date = date
    }
}
