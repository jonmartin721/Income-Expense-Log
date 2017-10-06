//
//  SLVViewController.swift
//  Income-Expense Log
//
//  Created by Group12 on 10/3/17.
//  Copyright © 2017 JonathanMartin. All rights reserved.
//

import UIKit

class SLVViewController: UIViewController,  UITextFieldDelegate {
    
    struct financials{
        var ttlSalary:Double = 0
        var ttlExpense:Double = 0
    }
    
    var totalSalary: Double = 0
    
    //outlets and actions
    @IBOutlet var incomeTextField: UITextField!
    @IBOutlet var totalSalaryLabel: UILabel!
    @IBAction func addIncomeClicked () {
        if let text = incomeTextField.text, let value = Double(text) {
            totalSalary  = totalSalary + value
        }
        totalSalaryLabel.text = String(totalSalary)
        incomeTextField.text = ""
    }
    
    //sets things for first time loading
    override func viewDidLoad() {
        incomeTextField.text = ""
        totalSalaryLabel.text = "0"
    }
    
    //validates textFields against whitespaces, punctuation, and negative
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil{
            return false
        }
        
        //prevents user from typing letters or whitespaces
        let letterCharacters = NSCharacterSet.letters
        let blankCharacter = NSCharacterSet.whitespacesAndNewlines
        let punctuationCharacter = NSCharacterSet.punctuationCharacters
        
        let containLetterCharacter = string.rangeOfCharacter(from: letterCharacters) //no letters
        let containBlankCharacter = string.rangeOfCharacter(from: blankCharacter) //no whitespaces
        let containNegative = string.rangeOfCharacter(from: punctuationCharacter) //no negatives
        if containLetterCharacter != nil || containBlankCharacter != nil || containNegative != nil {
            return false
        }   else {
            return true
        }
    }
    
//    let svc = financials.init(ttlSalary: 0, ttlExpense: 0)
//    svc.data = self.data
//    svc.ttlSalary = totalSalary
    
}

