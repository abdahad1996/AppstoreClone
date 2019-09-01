//
//  animation.swift
//  AppstoreClone
//
//  Created by prog on 9/1/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionViewController{
    public  func reload(collectionView:UICollectionView,animationDirection:String) {
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        let cells = collectionView.visibleCells
        var index = 0
        let tableHeight: CGFloat = collectionView.bounds.size.height
        for i in cells {
            let cell: UICollectionViewCell = i as UICollectionViewCell
            switch animationDirection {
            case "up":
                cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                break
            case "down":
                cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                break
            case "left":
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            case "right":
                cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                break
            default:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            }
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
}

extension UITableViewController{
    public  func reload(collectionView:UICollectionView,animationDirection:String) {
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        let cells = collectionView.visibleCells
        var index = 0
        let tableHeight: CGFloat = collectionView.bounds.size.height
        for i in cells {
            let cell: UICollectionViewCell = i as UICollectionViewCell
            switch animationDirection {
            case "up":
                cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                break
            case "down":
                cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                break
            case "left":
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            case "right":
                cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                break
            default:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            }
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
}
