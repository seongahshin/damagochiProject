//
//  SettingTableViewController.swift
//  damagochiProject
//
//  Created by 신승아 on 2022/07/24.
//

import UIKit

class SettingTableViewController:
    UITableViewController {
    let Infom = SettingInfo().setting
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        cell.settingImage.image = UIImage(systemName: Infom[indexPath.row].cellImage)
        cell.settingTitle.text = Infom[indexPath.row].cellTitle
        cell.settingDetail.text = Infom[indexPath.row].cellDetailTitle
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "NameChangeViewController") as! NameChangeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
