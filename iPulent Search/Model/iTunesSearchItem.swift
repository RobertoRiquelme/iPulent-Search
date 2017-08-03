//
//  iTunesSearchItem.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import Foundation


//https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/
// Requirements:
//
struct iTunesSearchItem: Codable{
    let kind: String
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionViewUrl: URL // Album URL
    let artworkUrl100: URL  
}

