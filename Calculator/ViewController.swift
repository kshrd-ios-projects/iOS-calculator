//
//  ViewController.swift
//  Calculator
//
//  Created by Chhaileng Peng on 6/2/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var smallLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    var firstNumber = 0
    var secondNumber = 0
    var btnCalLabel = ""
    var isCalMore = true
    
    
    @IBAction func btnNumberUI(_ sender: UIButton) {
        isCalMore = true
        let btnLabel = sender.titleLabel?.text
        let firstScreen = mainLabel.text!.first!
        if firstScreen == "0" {
            mainLabel.text! = btnLabel!
        } else {
            mainLabel.text! += btnLabel!
        }
        
        //print(type(of: mainLabel.text!))
    }
    
    @IBAction func btnCalculator(_ sender: UIButton) {
        btnCalLabel = (sender.titleLabel?.text)!
        smallLabel.text = "\(mainLabel.text!) \(btnCalLabel) "
        firstNumber = Int(mainLabel.text!)!
        mainLabel.text = "0"
    }
    
    @IBAction func btnResult(_ sender: Any) {
        
        if isCalMore {
            secondNumber = Int(mainLabel.text!)!
            smallLabel.text! += mainLabel.text!
            let result = calculate()
            mainLabel.text = "\(result)"
            isCalMore = false
        }
    }
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        smallLabel.text = ""
        mainLabel.text = "0"
    }
    
    func calculate() -> Int {
        switch btnCalLabel {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "×":
            return firstNumber * secondNumber
        case "÷":
            return firstNumber / secondNumber
        case "":
            return firstNumber % secondNumber
        default:
            return 0
        }
    }
	
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

