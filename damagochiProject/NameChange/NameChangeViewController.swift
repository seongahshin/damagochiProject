//
//  NameChangeViewController.swift
//  damagochiProject
//
//  Created by 신승아 on 2022/07/24.
//

import UIKit

class NameChangeViewController: UIViewController {

    @IBOutlet weak var nameChangeTextField: UITextField!
    
    var name = SettingInfo().setting
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(savebarButtonClicked))
        textFieldDesign()
    }
    
    @objc
    func savebarButtonClicked() {
        
        if nameChangeTextField.text == "" {
            UserDefaults.standard.set("대장",forKey: "change")
        } else {
            UserDefaults.standard.set(nameChangeTextField.text, forKey: "change")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDesign() {
        nameChangeTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: nameChangeTextField.frame.size.height-1, width: nameChangeTextField.frame.width, height: 1)
        border.backgroundColor = CGColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        nameChangeTextField.layer.addSublayer((border))
        nameChangeTextField.textAlignment = .left
        nameChangeTextField.placeholder = "대장님의 이름을 알려주세용!"
    }
    
    

    
}
