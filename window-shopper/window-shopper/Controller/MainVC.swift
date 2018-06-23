//
//  ViewController.swift
//  window-shopper
//
//  Created by Fox on 09/06/2018.
//  Copyright © 2018 Fox. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTXT: CurrencyTextField!
    @IBOutlet weak var priceTXT: CurrencyTextField!
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        //target of calcBtn is itself and it open calculator on MainVC wiew for gestures like touchUpInside
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        // when you touch one of these - keyboard apper and you can start using it
        wageTXT.inputAccessoryView = calcBtn
        priceTXT.inputAccessoryView = calcBtn
        
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        
    }

    @objc func calculate(){
        if let wageTxt = wageTXT.text, let priceTXT = priceTXT.text {
            if let wage = Double(wageTxt), let price = Double(priceTXT) {
                view.endEditing(true) //hide keyboard
                resultLbl.isHidden = false //show labels
                hoursLbl.isHidden = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"//insert into function
            }
        }
    }
    
    @IBAction func clearCalculator(_ sender: Any) {
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        wageTXT.text = " "
        priceTXT.text = " "
    }
    
}

