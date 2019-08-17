//
//  Service.swift
//  AppstoreClone
//
//  Created by prog on 6/29/19.
//  Copyright © 2019 prog. All rights reserved.
//

import Foundation

//The Achilles heel of singletons is multithreading. You need to be very careful when implementing singletons in a multithreading environment. And since we’re working on iOS here, this applies to us. In order not to corrupt our data, we need to control the write access in the singleton. One of the ways we can do this is to raise a dispatch barrier.

//I assume you know a thing or two about multithreading, so I’ll get to the point. A dispatch barrier will ensure that a piece of code will be executed, and while it’s being executed, no other piece of code will be executed. This is very important. With this simple GCD flag, we’ll be able to solve our problems.




class Service {
    
    static let shared = Service() // singleton
    private init(){}
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
fetchGenericJson(urlString: url, completion: completion)
    }
    
    func fetchGames(completion:@escaping (AppGroup?,Error?)->() ){
        fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json", completion: completion)
    }
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }

    
    //Helper method to call
    func fetchAppGroup(urlString:String,completion:@escaping (AppGroup?,Error?)->() ) {
        guard let url = URL(string: urlString) else {return}
        fetchGenericJson(urlString: url, completion: completion)
    }
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else { return }
        fetchGenericJson(urlString: url, completion: completion)
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//            do {
//                let objects = try JSONDecoder().decode([SocialApp].self, from: data!)
//                // success
//                completion(objects, nil)
//            } catch {
//                completion(nil, error)
//            }
//            }.resume()
    }
    
    // in generics we decide the datatype when we call the method.T can be anything it is decided when it called.
    func fetchGenericJson<T:Decodable>(urlString:URL,completion:@escaping (T?,Error?)->()) {
        URLSession.shared.dataTask(with: urlString) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
        }
    
}

// Stack

// Generic is to declare the Type later on

class Stack<T: Decodable> {
    var items = [T]()
    func push(item: T) { items.append(item) }
    func pop() -> T? { return items.last }
}

import UIKit

func dummyFunc() {
    //    let stackOfImages = Stack<UIImage>()
    
    let stackOfStrings = Stack<String>()
    stackOfStrings.push(item: "HAS TO BE STRING")
    
    let stackOfInts = Stack<Int>()
    stackOfInts.push(item: 1)
}
