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
    private let baseURL = "https://itunes.apple.com/"
    private let limit = 20
    private let mediaType = "music"
    
    
    func doSearch(for query: String, completion: @escaping (iTunesResult) -> ()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let queryType = "search?"
        let queryWithAllowedChars = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!.lowercased()
        let queryTerm = "term=\(queryWithAllowedChars)"
        let queryMedia = "mediaType=\(mediaType)"
        let queryLimit = "limit=\(limit)"
        
        
        if let url = URL(string: "\(baseURL)\(queryType)\(queryTerm)&\(queryMedia)&\(queryLimit)") {
            URLSession.shared.invalidateAndCancel()
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                var result = iTunesResult()
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
                            result =  try JSONDecoder().decode(iTunesResult.self, from: usableData)
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
    
    func getTracks(for query: Int, completion: @escaping (iTunesAlbumResult) -> ()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let queryType = "lookup?"
        let queryId = "id=\(query)"
        let queryEntity = "entity=song"
        
        if let url = URL(string: "\(baseURL)\(queryType)\(queryId)&\(queryEntity)") {
            URLSession.shared.invalidateAndCancel()
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                var result = iTunesAlbumResult()
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
                            result =  try JSONDecoder().decode(iTunesAlbumResult.self, from: usableData)
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

