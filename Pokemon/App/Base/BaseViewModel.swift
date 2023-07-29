//
//  BaseViewModel.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

class BaseViewModel: NSObject {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override init() {
        // you can get data from realm or smt and set to be ready to start to app
        // DataProvider.shared.resultSmt.onNext(1)
    }
}
