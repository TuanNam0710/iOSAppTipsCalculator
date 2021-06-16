//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            calculatorBrain.setTotalPercentage(totalPercentage: 1.0)
        } else if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            calculatorBrain.setTotalPercentage(totalPercentage: 1.1)
        } else {
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            calculatorBrain.setTotalPercentage(totalPercentage: 1.2)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        calculatorBrain.setPeople(numPeople: Int(splitNumberLabel.text!)!)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = Double((billTextField.text?.replacingOccurrences(of: ",", with: "."))!)!
        calculatorBrain.setBill(bill: totalBill)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculatorBrain.getResult()
            destinationVC.numberPeople = calculatorBrain.getPeople()
            destinationVC.tipPercentage = calculatorBrain.getTip()
        }
    }
}

