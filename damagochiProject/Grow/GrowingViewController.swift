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
    @IBOutlet weak var growingDamaImage: UIImageView!
    @IBOutlet weak var levelText: UILabel!
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var drinkTextField: UITextField!
    @IBOutlet weak var damaTitleLabel: UILabel!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    
    @IBOutlet var buttonSet: [UIButton]!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var eatButton: UIButton!
    @IBOutlet var labelSet: [UILabel]!
    @IBOutlet var textFieldSet: [UITextField]!
    
    var foodCount = 0
    var driknCount = 0
    var damaImageStar: String?
    var damaTitleStar: String?
    var nickName = "대장"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 252/225, blue: 252/255, alpha: 1)
        self.navigationItem.title = "\(nickName)님의 다마고치"
        self.navigationItem.hidesBackButton = true
        growingDamaImage.image = UIImage(named: damaImageStar ?? "")
        damaTitleLabel.text = damaTitleStar
        damaTitleLabelDesign()
        labelSetDesign()
        ButtonDesign()
        textFieldDesign()
        totalLevelCount()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(personButtonClicked))
        self.navigationController?.navigationBar.tintColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        
        
            }
    
    
    @objc
    func personButtonClicked() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFieldDesign() {
        
        for item in textFieldSet {
            item.borderStyle = .none
            let border = CALayer()
            border.frame = CGRect(x: 0, y: item.frame.size.height-1, width: item.frame.width, height: 1)
            border.backgroundColor = CGColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
            item.layer.addSublayer((border))
            item.textAlignment = .center
        }
        foodTextField.placeholder = "밥주세용"
        drinkTextField.placeholder = "물주세용"
        
    }

    func labelSetDesign() {
        for item in labelSet {
            item.font = .systemFont(ofSize: 13)
            item.textColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
            item.textAlignment = .center
        }
        levelText.text = "LV\(UserDefaults.standard.integer(forKey: "level"))"
        foodLabel.text = "밥알 \(UserDefaults.standard.integer(forKey: "food"))개"
        drinkLabel.text = "물방울 \(UserDefaults.standard.integer(forKey: "drink"))개"
    }
    
    func damaTitleLabelDesign() {
        damaTitleLabel.textAlignment = .center
        damaTitleLabel.font = .systemFont(ofSize: 13)
        damaTitleLabel.textColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)

        damaTitleLabel.layer.borderWidth = 1
        damaTitleLabel.layer.cornerRadius = 4
        damaTitleLabel.layer.borderColor = CGColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
    }
    
    func ButtonDesign() {
        eatButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        drinkButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        eatButton.setTitle("밥먹기", for: .normal)
        drinkButton.setTitle("물먹기", for: .normal)
        for item in buttonSet {
            item.tintColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
            item.layer.borderColor = CGColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
            item.layer.borderWidth = 1
            item.layer.cornerRadius = 4
            item.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        }
    }
    
    func talkLabelDesign() {
        talkLabel.textColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        talkLabel.font = .boldSystemFont(ofSize: 13)
        talkLabel.numberOfLines = 6
        talkLabel.textAlignment = .center
    }
    
    func totalLevelCount() {
        let totalCount = (UserDefaults.standard.integer(forKey: "food")/5) + (UserDefaults.standard.integer(forKey: "drink")/2)
        var firstLevel = 0
        UserDefaults.standard.set(firstLevel,forKey: "level")
        
        let numberArray: [Int] = [1,2,3,4,5,6,7,8,9]
        var imageNumber = "1"
        
        for k in numberArray {
            if growingDamaImage.image == UIImage(named: "1-\(k)") {
                imageNumber = "1"
            } else if growingDamaImage.image == UIImage(named: "2-\(k)") {
                imageNumber = "2"
            } else if growingDamaImage.image == UIImage(named: "3-\(k)") {
                imageNumber = "3"
            }
        }
        
        
        switch totalCount {
        case 0..<10:
            let totalLevel = 1
            UserDefaults.standard.set(totalLevel, forKey: "level")
            UserDefaults.standard.set(imageNumber, forKey: "image")
            talkLabel.text = "저를 키우기로 결정하셨군요. \(nickName)님 저를 무럭무럭 자라게 해주세요!"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
            
        case 10..<20:
            let totalLevel = 1
            UserDefaults.standard.set(totalLevel, forKey: "level")
            UserDefaults.standard.set(imageNumber, forKey: "image")
            talkLabel.text = "저를 키우기로 결정하셨군요. \(nickName)님 저를 무럭무럭 자라게 해주세요!"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 20..<30:
            let totalLevel = 2
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "저는요 \(nickName)님의 사랑을 듬뿍 받고 자라요!"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 30..<40:
            let totalLevel = 3
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "저는요 \(nickName)님의 사랑을 듬뿍 받고 자라요!"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 40..<50:
            let totalLevel = 4
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "저는요 \(nickName)님의 사랑을 듬뿍 받고 자라요!"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 50..<60:
            let totalLevel = 5
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "저는요 \(nickName)님의 사랑을 듬뿍 받고 자라요!"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 60..<70:
            let totalLevel = 6
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "룰루랄라 세상에서 저는 밥 먹는게 제일 즐겁답니다! 나는야 세상에서 제일가는 멋쟁이^^"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 70..<80:
            let totalLevel = 7
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "룰루랄라 세상에서 저는 밥 먹는게 제일 즐겁답니다! 나는야 세상에서 제일가는 멋쟁이^^"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 80..<90:
            let totalLevel = 8
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "룰루랄라 세상에서 저는 밥 먹는게 제일 즐겁답니다! 나는야 세상에서 제일가는 멋쟁이^^"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        case 90..<100:
            let totalLevel = 9
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "룰루랄라 세상에서 저는 밥 먹는게 제일 즐겁답니다! 나는야 세상에서 제일가는 멋쟁이^^"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
        default:
            var totalLevel = 10
            UserDefaults.standard.set(imageNumber, forKey: "image")
            UserDefaults.standard.set(totalLevel, forKey: "level")
            talkLabel.text = "와! 드디어 10단계가 되었어요! 저를 키워주셔서 감사합니다 \(nickName)님! 항상 행복이 가득하시길 바랄게요!"
            growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level"))")
            if totalLevel == 10 {
                totalLevel = 9
                growingDamaImage.image = UIImage(named: "\(imageNumber)-\(UserDefaults.standard.integer(forKey: "level")-1)")
            }
        }

        
        levelText.text = "LV\(UserDefaults.standard.integer(forKey: "level"))"
        
        talkLabelDesign()
    }
    
    @IBAction func eatButtonClicked(_ sender: UIButton) {
        let foodNumber: Int? = Int(foodTextField.text ?? "")
        let foodCount = UserDefaults.standard.integer(forKey: "food")
        
        if foodTextField.text != "" {
            if (1...99).contains(foodNumber ?? 0) {
                let foodUpdateCount = foodCount + (foodNumber ?? 0)
                UserDefaults.standard.set(foodUpdateCount, forKey: "food")
            }
        } else {
            let foodUpdateCount = foodCount + 1
            UserDefaults.standard.set(foodUpdateCount, forKey: "food")
        }
        foodLabel.text = "밥알 \(UserDefaults.standard.integer(forKey: "food"))개"
        totalLevelCount()
        foodTextField.text = ""
        
    }
    
    
    @IBAction func drinkButtonClicked(_ sender: UIButton) {
        let drinkNumber: Int? = Int(drinkTextField.text ?? "")
        let drinkCount = UserDefaults.standard.integer(forKey: "drink")
        
        if drinkTextField.text != "" {
            if (1...49).contains(drinkNumber ?? 0) {
                let drinkUpdateCount = drinkCount + (drinkNumber ?? 0)
                UserDefaults.standard.set(drinkUpdateCount, forKey: "drink")
            }
        } else {
            let drinkUpdateCount = drinkCount + 1
            UserDefaults.standard.set(drinkUpdateCount, forKey: "drink")
        }
        drinkLabel.text = "물방울 \(UserDefaults.standard.integer(forKey: "drink"))개"
        totalLevelCount()
        drinkTextField.text = ""
    }
    


}
