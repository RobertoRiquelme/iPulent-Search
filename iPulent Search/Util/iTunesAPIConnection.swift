//
//  iTunesAPIConnection.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//
// Decided to go with native URLSession. Alamofire is a good alternative.

import UIKit

class iTunesAPIConnection{
    
    static let instance = iTunesAPIConnection()
    private let baseURL = "https://itunes.apple.com/search?"
    private let limit = 20
    private let mediaType = "music"
    
    
    func doSearch(for query: String, completion: @escaping (iTunesResults) -> ()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let queryTerm = "term=\(query)"
        let queryMedia = "mediaType=\(mediaType)"
        let queryLimit = "limit=\(limit)"
        
        
        if let url = URL(string: "\(baseURL)\(queryTerm)&\(queryMedia)&\(queryLimit)") {
            URLSession.shared.invalidateAndCancel()
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                var result = iTunesResults(resultCount: 0, results: [])
                if error != nil {
                    print(error.debugDescription)
                    //TODO: Connection error
                    return
                } else {
                    if let response = response as? HTTPURLResponse {
                        if response.statusCode != 200 {
                            print("HTTPERROR: \(response.statusCode)")
                            //TODO: Define what to do here
                        }
                    }
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

