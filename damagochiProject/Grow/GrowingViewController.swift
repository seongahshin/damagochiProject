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
    
    
    @IBOutlet weak var levelText: UILabel!
    @IBOutlet weak var foodTextField: UITextField!
    
    @IBOutlet weak var drinkTextField: UITextField!
    
    
    var foodCount = 0
    var driknCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTextFieldDesign()
        
    }
    
    func foodTextFieldDesign() {
        foodTextField.keyboardType = .numberPad
    }
    
    func totalLevelCount() {
        let totalCount = (foodCount/5) + (driknCount/2)
        var totalLevel = 0
        
        switch totalCount {
        case 0..<10:
            totalLevel = 1
        case 10..<20:
            totalLevel = 1
        case 20..<30:
            totalLevel = 2
        case 30..<40:
            totalLevel = 3
        case 40..<50:
            totalLevel = 4
        case 50..<60:
            totalLevel = 5
        case 60..<70:
            totalLevel = 6
        case 70..<80:
            totalLevel = 7
        case 80..<90:
            totalLevel = 8
        case 90..<100:
            totalLevel = 9
            
        default:
            totalLevel = 10
        }
        levelText.text = "LV\(totalLevel)"
    }
    
    @IBAction func eatButtonClicked(_ sender: UIButton) {
        if foodTextField.text != "" {
            let foodNumber: Int? = Int(foodTextField.text ?? "")
            if (1...99).contains(foodNumber ?? 0) {
                foodCount += foodNumber ?? 0
            }
        } else {
            foodCount += 1
        }
        foodLabel.text = "밥알 \(foodCount)개"
        totalLevelCount()

    }
    
    
    @IBAction func drinkButtonClicked(_ sender: UIButton) {
        if drinkTextField.text != "" {
            let drinkNumber: Int? = Int(drinkTextField.text ?? "")
            if (1...49).contains(drinkNumber ?? 0) {
                driknCount += drinkNumber ?? 0
            }
        } else {
            driknCount += 1
        }
        drinkLabel.text = "물방울 \(driknCount)개"
        totalLevelCount()
    }
    


}
