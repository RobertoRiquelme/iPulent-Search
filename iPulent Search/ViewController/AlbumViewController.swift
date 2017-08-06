//
//  AlbumViewController.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/2/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import UIKit
import WebKit

class AlbumViewController: UIViewController, WKUIDelegate {

    //MODEL
    
    var myiTunesResult: iTunesSearchItem!

    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Album Detail"
        self.navigationItem.backBarButtonItem?.target =  self
        updateUI()
    }
    
    func updateUI(){
        artistName?.text = myiTunesResult?.artistName
        albumName?.text = myiTunesResult?.collectionName
        //songName?.text = myiTunesResult?.trackName
        //albumURL = myiTunesResult?.collectionViewUrl
        
        if let albumImageURL = myiTunesResult?.artworkUrl100 {
            // FIXME: Blocks main thread
            if let imageData = try? Data(contentsOf: albumImageURL){
                albumCover?.image = UIImage(data: imageData)
            }
        } else {
            albumCover?.image = nil
        }
    }
}
