//
//  ResultTableViewCell.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {


    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var songName: UILabel!
    var albumURL: URL!
    
    var searchItem: iTunesSearchItem?{
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        artistName?.text = searchItem?.artistName
        albumName?.text = searchItem?.collectionName
        songName?.text = searchItem?.trackName
        albumURL = searchItem?.collectionViewUrl
        
        if let albumImageURL = searchItem?.artworkUrl100 {
            // FIXME: Blocks main thread
            if let imageData = try? Data(contentsOf: albumImageURL){
                albumCover?.image = UIImage(data: imageData)
            }
        } else {
            albumCover?.image = nil
        }
    }    
}
