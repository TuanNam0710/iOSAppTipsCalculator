//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Pham Le Tuan Nam on 16/06/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var totalPercentage = 0.0
    var bill = 0.0
    var numPeople = 2
    
    mutating func setTotalPercentage(totalPercentage: Double) {
        self.totalPercentage = totalPercentage
    }
    
    mutating func setBill(bill: Double) {
        self.bill = bill
    }
    
    mutating func setPeople(numPeople: Int) {
        self.numPeople = numPeople
    }
    
    func getPeople() -> Int {
        return numPeople
    }
    
    func getResult() -> Double {
        return (bill * totalPercentage) / Double(numPeople)
    }
    
    func getTip() -> Int {
        return Int(totalPercentage * 100 - 100)
    }
}
