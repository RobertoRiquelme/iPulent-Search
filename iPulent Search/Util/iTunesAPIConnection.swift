//
//  iTunesAPIConnection.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import UIKit

class iTunesAPIConnection{
    
    static let instance = iTunesAPIConnection()
    private let baseURL = "https://itunes.apple.com/search?term=in+utero&mediaType=music&limit=20"
    
    func doSearch(completion: @escaping (iTunesResults) -> ()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if let url = URL(string: baseURL) {
            URLSession.shared.invalidateAndCancel()
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                var result = iTunesResults(resultCount: 0, results: [])
                if error != nil {
                    print(error.debugDescription)
                } else {
                    if let usableData = data {
                        do{
                            result =  try JSONDecoder().decode(iTunesResults.self, from: usableData)
                        } catch {
                            print(error)
                        }
                    }
                }
                
                DispatchQueue.main.async(execute: {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    completion(result)
                })
                
            }
            task.resume()
        }
    }
}

