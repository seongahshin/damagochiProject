//
//  GrowingViewController.swift
//  damagochiProject
//
//  Created by 신승아 on 2022/07/23.
//

import UIKit

class GrowingViewController: UIViewController {
    
    @IBOutlet weak var talkLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var drinkLabel: UILabel!
    
    @IBOutlet weak var foodTextField: UITextField!
    var foodCount = 0
    var driknkCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTextFieldDesign()
        
    }
    
    func foodTextFieldDesign() {
        foodTextField.keyboardType = .numberPad
    }
    
    @IBAction func eatButtonClicked(_ sender: UIButton) {
        if foodTextField.text != "" {
            let foodNumber: Int? = Int(foodTextField.text ?? "")
            foodCount += foodNumber ?? 0
        } else {
            foodCount += 1
        }
        foodLabel.text = "밥알 \(foodCount)개"
    }
    
    
    @IBAction func drinkButtonClicked(_ sender: UIButton) {
        driknkCount += 1
        drinkLabel.text = "물방울 \(driknkCount)개"
    }
    


}
