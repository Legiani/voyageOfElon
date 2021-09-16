//
//  ViewController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 13.09.2021.
//

import UIKit
import Foundation

class LaunchViewController: UIViewController, UISearchResultsUpdating {


    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    
    
    let cellIdentifier = "LaunchCellIdentifier"
    var loadLaunches: [LaunchElement] = []
    var launchesSorted: [LaunchElement] = []
    
    var sort: AnyKeyPath = \LaunchElement.launchpad {
        didSet {
            sortData()
        }
    }
    var search: String? = nil {
        didSet {
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LaunchCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        searchController.searchResultsUpdater = self

        navigationItem.searchController = searchController
        
        loadData()
    }
    
    func loadData() {
        guard let request = try? getAllLaunches.init() else {
            fatalError("Unable to create task getAllLaunches")
        }
        
        APIManager.shared.getJsonRequest(
            withRequest: request,
            completionHandler: { [weak self] (data) in
                do {
                    let recivedLauches = try JSONDecoder().decode([LaunchElement].self, from: data!)
                    self?.loadLaunches = recivedLauches
                    self?.launchesSorted = recivedLauches
                    
                    self?.sortData()
                } catch {
                   print(error)
                }
                
            }, errorHandler: { (error) in
                print(error)
            }, loadingHandler: { (show) in
                
            }
        )
    }
    
    
    
    func sortData() {
        launchesSorted = loadLaunches.sorted(by: sort)
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
    }
    
    @IBAction func filterButton(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : SortViewController = storyboard.instantiateViewController(withIdentifier: "SortView") as! SortViewController
        vc.callBackBlock = { result in
            self.sort = result
            self.sortData()
        }

        let navigationController = UINavigationController(rootViewController: vc)

        self.present(navigationController, animated: true, completion: nil)
    }
    
}

extension LaunchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        launchesSorted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LaunchCell else {
            fatalError("Unable to dequeue \(cellIdentifier)")
        }

        let launch = launchesSorted[indexPath.row]
        
        cell.prepareForReuse()
        
        cell.successSwitch = launch.success
        cell.launchLabel.text = launch.name
        cell.staticFireLabel.text = launch.dateUtc
        cell.imageURL = launch.links.patch.small
        return cell
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
