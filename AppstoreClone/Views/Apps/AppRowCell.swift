//
//  AppRowCell.swift
//  AppstoreClone
//
//  Created by prog on 7/3/19.
//  Copyright © 2019 prog. All rights reserved.
//

import UIKit

class AppRowCell : UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET", fontSize: 16, width: 80, height: 32)
    
    override init(frame:CGRect){
        super.init(frame: frame)
        imageView.backgroundColor = .purple
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
    
      
        
        let stackView = UIStackView(arrangedSubviews: [imageView,VerticalStackView(arrangedSubviews: [nameLabel,companyLabel], spacing: 4),UIView(),getButton])
        addSubview(stackView)
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.fillSuperview()
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
