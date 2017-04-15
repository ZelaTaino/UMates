//
//  InterestsViewController.swift
//  UMates
//
//  Created by Glizela Taino on 4/12/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    //collection view
    @IBOutlet weak var flowLayout: FlowLayout!
    @IBOutlet weak var collection: UICollectionView!
    var sizingCell: TagCell?
    
    //search
    var searchController: UISearchController!
    var resultsController = UITableViewController()
    var filteredInterests = [String]()
    
    //data
    var interests = [String]()
    let allInterest = ["Basketball", "Being Drake", "Partying", "Lifting", "Wrestling", "Fishing", "Hockey"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collection view
        collection.delegate = self
        collection.dataSource = self
        let cellNib = UINib(nibName: "TagCell", bundle: nil)
        self.collection.register(cellNib, forCellWithReuseIdentifier: "TagCell")
        self.collection.backgroundColor = UIColor.clear
        self.sizingCell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! TagCell?
        self.flowLayout.sectionInset = UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0)
        
        //search
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        resultsController.tableView.dataSource = self
        resultsController.tableView.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
        
        resultsController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
     
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredInterests.removeAll(keepingCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@ ", searchController.searchBar.text!)
        let array = (self.allInterest as NSArray).filtered(using: searchPredicate)
        self.filteredInterests = array as! [String]
        resultsController.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredInterests.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        if searchController.isActive {
            cell.textLabel?.font = UIFont(name: "Avenir", size: 22.0)
            cell.textLabel?.textColor = UIColor(red: 192/255, green: 0/255, blue: 0/255, alpha: 1)
            cell.textLabel?.text = filteredInterests[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let cellTitle = cell?.textLabel?.text
        interests.append(cellTitle!)
        collection.reloadData()
        searchController.isActive = false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        self.configureCell(cell: cell, forIndexPath: indexPath as NSIndexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.configureCell(cell: self.sizingCell!, forIndexPath: indexPath as NSIndexPath)
        return self.sizingCell!.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    }
    
    func configureCell(cell: TagCell, forIndexPath indexPath: NSIndexPath) {
        let tag = interests[indexPath.row]
        cell.tagName.text = tag
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
