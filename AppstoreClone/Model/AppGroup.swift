//
//  AppGroup.swift
//  AppstoreClone
//
//  Created by prog on 7/3/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation

struct AppGroup :Decodable{
    let feed:Feed
}
struct Feed :Decodable{
    let title:String
    let results:[FeedResult]
}
struct FeedResult:Decodable {
    let name:String
    let artistName:String
    let artworkUrl100:String
}
