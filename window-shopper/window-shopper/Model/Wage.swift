//
//  Wage.swift
//  window-shopper
//
//  Created by Fox on 23/06/2018.
//  Copyright © 2018 Fox. All rights reserved.
//

import Foundation
class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price/wage))
        
    }
}
