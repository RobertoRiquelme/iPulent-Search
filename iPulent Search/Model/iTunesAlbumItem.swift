//
//  iTunesAlbumItem.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/6/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import Foundation


//https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/
// Requirements:
//
struct iTunesAlbumItem: Codable{
    var wrapperType: String
    var kind: String?
    var artistName: String
    var collectionName: String
    var collectionId: Int
    var trackName: String
    var trackNumber: Int
    var trackCount: Int
    var artworkUrl100: URL
}
