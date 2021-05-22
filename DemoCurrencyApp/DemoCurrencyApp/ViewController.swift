//
//  ViewController.swift
//  DemoCurrencyApp
//
//  Created by Anurag Agrawal on 21/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountTxt: UITextField!
    @IBOutlet weak var deductAmountTxt: UITextField!
    @IBOutlet weak var SubmitButton: UIButton!
    @IBOutlet weak var calcuateAmountLabel: UILabel!
    @IBOutlet weak var rOneAmountLabel: UILabel!
    @IBOutlet weak var rTwoAmountLabel: UILabel!
    @IBOutlet weak var rFiveAmountLabel: UILabel!
    @IBOutlet weak var rTenAmountLabel: UILabel!
    @IBOutlet weak var rFiftyAmountLabel: UILabel!
    @IBOutlet weak var rHunderedAmountLabel: UILabel!
    @IBOutlet weak var rTwoHunderedAmountLabel: UILabel!
    var amount = ""
    var deduct = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressedButton(_ sender: UIButton) {
        //var finalAmount: Int = (Int(amountTxt?.text ?? 0) - Int(deductAmountTxt?.text ?? 0))
        rOneAmountLabel.text = ""
        calcuateAmountLabel.text = ""
        if amountTxt.text?.isEmpty ?? true && deductAmountTxt.text?.isEmpty ?? true{
            print("textField has no text")
            } else {
                
                let amountValue = Int(amountTxt.text!)
                let deductValue = Int(deductAmountTxt.text!)
                var finalAmount = Int(amountValue! - deductValue!)
                calcuateAmountLabel.text = String(finalAmount)
                let notes = [200, 100, 50, 10, 5, 2, 1]
                let noteCounter = [0, 0, 0, 0, 0, 0, 0]
                
                print("Currency Count ->")
                for (var i, var j) in zip(notes, noteCounter) {
                    if finalAmount >= i {
                        j = finalAmount / i
                        finalAmount = finalAmount - j * i
                        print (i ," : ", j)
                        rOneAmountLabel.text? += "R\(i) : \(j) |"
                    }
                }
            }
        }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            print("TextField should return method called")
            textField.resignFirstResponder();
            return true;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            print("TextField did end editing method called\(textField.text!)")
        if textField == amountTxt {
            amount = amountTxt?.text ?? "0"
        } else {
            deduct = deductAmountTxt?.text ?? "0"
        }
    }
}

