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
    var kind: String
    var artistName: String
    var collectionName: String
    var trackName: String
    var collectionViewUrl: URL // Album URL
    var artworkUrl100: URL
}

