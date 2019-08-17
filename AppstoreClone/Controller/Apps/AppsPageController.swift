//
//  AppsPageController.swift
//  AppstoreClone
//
//  Created by prog on 7/2/19.
//  Copyright © 2019 prog. All rights reserved.
//

import UIKit
class AppsPageController : BaseListController,UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let headerId = "headerId"
    let activityIndicatorView:UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        // 1
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        fetchData()
    
    }
    var socialApps = [SocialApp]()
    var groups = [AppGroup]()
    
    func fetchData(){
        var group1:AppGroup?
        var group2:AppGroup?
        var group3:AppGroup?
        
        // help you sync your data fetches together and when all tasks are done it calls notify method

        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (appGroup, err) in
            print("done with games")
            dispatchGroup.leave()
            print("hello1")

            group1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (appGroup, err) in
            print("done with topgrossing")
            dispatchGroup.leave()
            print("hello2")

            group2 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json") { (appGroup, err) in
            print("done with top free")

            dispatchGroup.leave()
            print("hello3")
            group3 = appGroup
        }
           dispatchGroup.enter()
        Service.shared.fetchSocialApps { (apps, err) in
            dispatchGroup.leave()
            self.socialApps = apps ?? []
        }
        
        //after completion of all the tasks this is run on whatever queue you want. here we run it in main thread
        
        dispatchGroup.notify(queue: .main){
            print("completed your dispatch group tasks ...")
            
            self.activityIndicatorView.stopAnimating()
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            
            self.collectionView.reloadData()
        }
    }
    // 2
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.socialApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()

        return header
    }
    
    // 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        let appGroup = groups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    //for vertical collection view this is the space between successive rows
    //for horizontal collection view this is the space between successive columns
//    This spacing is not applied to the space between the header and the first line or between the last line and the footer.

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        //10 is by default
    }
    // For a vertically scrolling grid, this value represents the minimum spacing between successive rows. For a horizontally scrolling grid, this value represents the minimum spacing between successive columns.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    //For a vertically scrolling grid, this value represents the minimum spacing between items in the same row. For a horizontally scrolling grid, this value represents the minimum spacing between items in the same column
    
    // no effect here as only one item in a row
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
}
