//
//  SettingTableViewController.swift
//  damagochiProject
//
//  Created by 신승아 on 2022/07/24.
//

import UIKit

class SettingTableViewController:
    UITableViewController {
    
    var Infom = SettingInfo().setting
    var nameChanged: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 252/225, blue: 252/255, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "설정"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let indexPath = IndexPath.init(row: 0, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    var changedName: String?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        cell.settingImage.image = UIImage(systemName: Infom[indexPath.row].cellImage)
        cell.settingTitle.text = Infom[indexPath.row].cellTitle
       
        /// MARK : 텍스트 네임 넣기
        if indexPath.row == 0 {
            if let NameText = UserDefaults.standard.string(forKey: "change") {
                cell.settingName.text = NameText
            } else {
                cell.settingName.text = "대장"
            }
        }
        
        cell.settingImage.tintColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        cell.settingTitle.font = .boldSystemFont(ofSize: 13)
        cell.settingName.textColor = UIColor(red: 77/255, green: 106/225, blue: 120/255, alpha: 1)
        cell.settingName.font = .systemFont(ofSize: 13)
        cell.backgroundColor = UIColor(red: 245/255, green: 252/225, blue: 252/255, alpha: 1)
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
        
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "NameChangeViewController") as! NameChangeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainCollectionViewController") as! MainCollectionViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실건가용?", preferredStyle: .alert)
            let no = UIAlertAction(title: "아냐!", style: .cancel)
            let ok = UIAlertAction(title: "웅!", style: .default, handler: someHandler(alert:))
            
            alert.addAction(no)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func someHandler(alert: UIAlertAction!) {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
                    UserDefaults.standard.removeObject(forKey: key.description)
    }
        // 영상처럼 화면 전환하는 법을 모르겠습니다ㅜㅜ
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainCollectionViewController")as! MainCollectionViewController
        self.navigationController?.pushViewController(vc, animated: true)

}
    
    
}
