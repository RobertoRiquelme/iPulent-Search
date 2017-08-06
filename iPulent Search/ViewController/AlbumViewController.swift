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
    
    var albumResult : iTunesAlbumResult!
    
    var searchId: Int = 0

    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var collectionId: UILabel!
    @IBOutlet weak var trackList: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Album Detail"
        self.navigationItem.backBarButtonItem?.target =  self
        searchRequest()
    }
    
    private func searchRequest() {
        let query = searchId
        iTunesAPIConnection.instance.getTracks(for: query){ [weak self] items in
            DispatchQueue.main.async{
                self?.albumResult = items
                self?.updateUI()
                }
 
        }
    }
    
    func updateUI(){
        artistName?.text = myiTunesResult?.artistName
        albumName?.text = myiTunesResult?.collectionName
        collectionId?.text = "\(myiTunesResult!.collectionId)"
        trackList?.text = "\(albumResult.results)"
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
