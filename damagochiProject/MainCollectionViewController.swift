//
//  MainCollectionViewController.swift
//  damagochiProject
//
//  Created by 신승아 on 2022/07/22.
//

import UIKit



class MainCollectionViewController: UICollectionViewController {
    var damaNameArray: [String] = ["따끔따끔 다마고치", "방실방실 다마고치", "반짝반짝 다마고치"]
    var damaImageArray: [String] = ["1-6", "2-6", "3-6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width/3, height: width/3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    // item
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    // cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        // cell 디자인
        if !(0...2).contains(indexPath.item) {
            cell.damaLabel.text = "준비중이에요"
            cell.damaImage.image = UIImage(named: "noImage")
        } else {
            cell.damaLabel.text = damaNameArray[indexPath.item]
            cell.damaImage.image = UIImage(named: damaImageArray[indexPath.item])
            cell.damaImage.alpha = 20
        }

        return cell
    }
    
   

}
