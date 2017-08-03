//
//  iTunesAPIConnection.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import Foundation

class iTunesAPIConnection{
    
    static let instance = iTunesAPIConnection()
    private let baseURL = "https://itunes.apple.com/search?term=in+utero&mediaType=music&limit=20"
    
    func doSearch() throws{//} -> [iTunesSearchItem]{
        if let url = URL(string: baseURL) {
            URLSession.shared.invalidateAndCancel()
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let usableData = data {
                        do{
                            let myStructArray =  try JSONDecoder().decode(iTunesResults.self, from: usableData)
                            print(myStructArray)//JSONSerialization

                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}

