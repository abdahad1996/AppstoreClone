//
//  HorizontalSnapController.swift
//  AppstoreClone
//
//  Created by prog on 7/15/19.
//  Copyright © 2019 prog. All rights reserved.
//

import UIKit

class HorizontalSnappingController : UICollectionViewController{
    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
