//
//  ViewController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 13.09.2021.
//

import UIKit
import Foundation

class LaunchViewController: UIViewController, UISearchResultsUpdating {

    let cellIdentifier = "LaunchCellIdentifier"
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    
    var loadLaunches: [LaunchElement] = []
    var launchesSorted: [LaunchElement] = []
    
    let sortOptions = [
        SortObject.init(id: 0, label: "Název", keyPath: \LaunchElement.name),
        SortObject.init(id: 1, label: "Start", keyPath: \LaunchElement.staticFireDateUtc),
        SortObject.init(id: 2, label: "Úspěch", keyPath: \LaunchElement.success)
    ]

    var search: String? = nil
    
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
        let request = getAllLaunches.init()
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
                self.showError(text: error.localizedDescription)
            }, loadingHandler: { (show) in
                
            }
        )
    }
    
    func sortData() {
        let sortId = UserDefaults.standard.integer(forKey: "sortOptions")
        
        launchesSorted = launchesSorted.sorted(by: sortOptions[sortId].keyPath)
        
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        let result = loadLaunches.filter({
            let lowercase = $0.name.lowercased()
            return lowercase.hasPrefix(text.lowercased())
        })

        launchesSorted = result
        sortData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        launchesSorted = loadLaunches
        sortData()
    }
    
    @IBAction func filterButton(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : SortViewController = storyboard.instantiateViewController(withIdentifier: "SortView") as! SortViewController
        vc.callBackBlock = { result in
            self.sortData()
        }

        let navigationController = UINavigationController(rootViewController: vc)

        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func actionButtonFilter(_ sender: Any) {
        
        let optionMenu = UIAlertController(title: nil, message: "Seřadit dle:", preferredStyle: .actionSheet)

        for options in sortOptions {
            let action = UIAlertAction(title: options.label, style: .default, handler: { (UIAlertAction) in
                UserDefaults.standard.set(options.id, forKey: "sortOptions")
                
                self.sortData()
            });
            optionMenu.addAction(action)
        }
        
        optionMenu.addAction(UIAlertAction(title: "Zavřít", style: .cancel))

        self.present(optionMenu, animated: true, completion: nil)
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
        cell.staticFireLabel.text = launch.staticFireDateUtc
        cell.imageURL = launch.links.patch.small
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
        vc.launch = launchesSorted[indexPath.row]

        self.navigationController?.pushViewController(vc, animated: true)
    }
}
