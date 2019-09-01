//
//  SearchResult.swift
//  AppstoreClone
//
//  Created by prog on 6/29/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
}
