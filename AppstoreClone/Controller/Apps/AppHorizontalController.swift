//
//  AppHorizontalController.swift
//  AppstoreClone
//
//  Created by prog on 7/3/19.
//  Copyright © 2019 prog. All rights reserved.
//

import UIKit
class AppHorizontalController:HorizontalSnappingController,UICollectionViewDelegateFlowLayout{
    let cellID = "cellID"

    var appGroup:AppGroup? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .white
        
      collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 2
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppRowCell
        cell.nameLabel.text = appGroup?.feed.results[indexPath.item].name
        cell.companyLabel.text = appGroup?.feed.results[indexPath.item].artistName
        cell.imageView.sd_setImage(with: URL(string: appGroup?.feed.results[indexPath.item].artworkUrl100 ?? ""))

        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    
    //for vertical collection view this is the space between successive rows
    //for horizontal collection view this is the space between successive columns

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 0, bottom: topBottomPadding, right: 0)
    }
    
    
}
