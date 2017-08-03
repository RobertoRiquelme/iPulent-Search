//
//  iTunesResult.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import Foundation

struct iTunesResults: Codable{
    let resultCount: Int
    let results: [iTunesSearchItem]
}
