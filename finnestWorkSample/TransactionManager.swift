//
//  TransactionManager.swift
//  finnestWorkSample
//
//  Created by Dominick Hera on 10/10/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class TransactionManager {
    static let shared = TransactionManager()
    var tranactionList: [Transaction] = []
    
    private init() {}
    
    func initTransactionList(callback: @escaping(_ error: Error?) -> Void ) {
        let url = "https://finnestworksampleserver.herokuapp.com/initTransactionList"
        Alamofire.request(url, method: .get,encoding: URLEncoding.httpBody)
            .responseJSON { response in
                response.result.ifSuccess {
                    let ResponseList = response.result.value as? NSArray
                    for item in ResponseList! {
                        let tempDescription = "\(((item as AnyObject).value(forKey: "description"))!)"
                        let tempAmount = "\(((item as AnyObject).value(forKey: "amount"))!)"
                        let tempDate = "\(((item as AnyObject).value(forKey: "date"))!)"
                        
                        let newTransaction = Transaction(description: tempDescription, amount: tempAmount, date: tempDate)
                        self.tranactionList.append(newTransaction)
                    }
                }
                callback(nil)
        }
    }
    
    func getNextNTranscations(callback: @escaping(_ error: Error?) -> Void) {
        
        let url = "https://finnestworksampleserver.herokuapp.com/getNext10Transactions/\(self.tranactionList.count)"
        Alamofire.request(url, method: .get ,encoding: URLEncoding.httpBody)
            .responseJSON { response in
                response.result.ifSuccess {
                    let ResponseList = response.result.value as? NSArray
                    for item in ResponseList! {
                        let tempDescription = "\(((item as AnyObject).value(forKey: "description"))!)"
                        let tempAmount = "\(((item as AnyObject).value(forKey: "amount"))!)"
                        let tempDate = "\(((item as AnyObject).value(forKey: "date"))!)"
                        
                        let newTransaction = Transaction(description: tempDescription, amount: tempAmount, date: tempDate)
                        self.tranactionList.append(newTransaction)
                    }
                }
                
                callback(nil)
        }
    }
}
