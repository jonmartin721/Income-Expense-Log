//
//  ELVViewController.swift
//  Income-Expense Log
//
//  Created by Group12 on 10/3/17.
//  Copyright © 2017 JonathanMartin. All rights reserved.
//

//
//  SLVViewController.swift
//  Income-Expense Log
//
//  Created by Group12 on 10/3/17.
//  Copyright © 2017 JonathanMartin. All rights reserved.
//

import UIKit

class ELVViewController: UIViewController,  UITextFieldDelegate {
    
    //outlets, actions, and variables
    var totalExpense: Double = 0
    @IBOutlet var expenseTextField: UITextField!
    @IBOutlet var totalExpenseLabel: UILabel!
    @IBAction func addExpenseClicked () {
        
        if let text = expenseTextField.text, let value = Double(text) {
            totalExpense += value
        }
        totalExpenseLabel.text = String(totalExpense)
        expenseTextField.text = ""
    }
    
    //sets fields on loading for the first time
    override func viewDidLoad() {
        expenseTextField.text = ""
        totalExpenseLabel.text = "0"
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
}


