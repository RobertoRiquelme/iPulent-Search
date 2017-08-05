//
//  SearchTableViewController.swift
//  iPulent Search
//
//  Created by Roberto Riquelme on 8/3/17.
//  Copyright © 2017 Roberto Riquelme. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    // Define the MODEL
    private var searchResult = iTunesResult() {
        didSet{
            print("searchResult: \(searchResult)")
        }
    }
    var searchText: String?{
        didSet{
            searchBar?.text = searchText
            searchBar?.resignFirstResponder()
            tableView.reloadData()
            searchRequest()
            title = searchText
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet{
            searchBar.delegate = self
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchText = searchBar.text
    }
    
    private func searchRequest() {
        if let query = searchText, !query.isEmpty{
            iTunesAPIConnection.instance.doSearch(for: query){ [weak self] items in
                DispatchQueue.main.async{
                    self?.searchResult = items
                    self?.tableView.reloadData()
                    self?.tableView.reloadRows(at: [IndexPath(row:0, section:0)], with: .fade)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        searchText = "Pink Floyd"
        searchRequest()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Result", for: indexPath)

        let result =  searchResult.results[indexPath.row]
        if let resultCell = cell as? ResultTableViewCell {
            resultCell.searchItem = result
        }
        
        return cell
    }

    var selectedURL: URL!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedURL = searchResult.results[indexPath.row].collectionViewUrl
        performSegue(withIdentifier: "ViewAlbum", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewAlbum"{
            if let albumViewController = segue.destination as? AlbumViewController {
                    albumViewController.albumURL = selectedURL
            }
            
        }
    }


}
