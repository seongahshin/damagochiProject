//
//  DetailViewController.swift
//  damagochiProject
//
//  Created by 신승아 on 2022/07/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var popUpDamaImage: UIImageView!
    @IBOutlet weak var popUpDamaLabel: UILabel!
    @IBOutlet weak var popUpDamaDetailLabel: UILabel!
    
    @IBOutlet weak var popUpAlert: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    // 값 전달
    var DamaData: Dama?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        damaTitleDesign()
        damaDescribeDesign()
        popUpAlertDesign()
        buttonDesign()
        // 백그라운드 투명도 조절
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.view.isOpaque = false
        
        // 값 전달
        popUpDamaImage.image = UIImage(named: DamaData!.imageName)
        popUpDamaLabel.text = DamaData!.damaDescribe
        popUpDamaDetailLabel.text = DamaData!.damaDetailDescribe
    }
    
    func damaTitleDesign() {
        popUpDamaLabel.textAlignment = .center
        popUpDamaLabel.font = .systemFont(ofSize: 13)
        popUpDamaLabel.textColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        popUpDamaLabel.layer.borderWidth = 1
        popUpDamaLabel.layer.cornerRadius = 4
        popUpDamaLabel.layer.borderColor = CGColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
    }
    
    func damaDescribeDesign() {
        popUpDamaDetailLabel.textAlignment = .center
        popUpDamaDetailLabel.font = .systemFont(ofSize: 13)
        popUpDamaDetailLabel.textColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
    }
    
    func popUpAlertDesign() {
        popUpAlert.layer.cornerRadius = 20
    }
    
    func buttonDesign() {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1), for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        cancelButton.titleLabel?.textAlignment = .center
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = CGColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1), for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        startButton.titleLabel?.textAlignment = .center
        startButton.layer.borderColor = CGColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        startButton.layer.borderWidth = 1
        
    }
    
    
    @IBAction func CancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
        
    }
    
    @IBAction func StartButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "GrowingViewController") as! GrowingViewController
        self.navigationController?.pushViewController(vc, animated: true)
//    
    
}

}


