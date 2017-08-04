//
//  iTunesResult.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import Foundation

struct iTunesResult: Codable{
    var resultCount: Int
    var results: [iTunesSearchItem]
    
    init(){
        self.resultCount = 0
        self.results = []
    }
    
    mutating func removeAll(){
        self.resultCount = 0
        self.results.removeAll()
    }
    
    
}
