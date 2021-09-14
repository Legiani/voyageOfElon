//
//  ViewController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 13.09.2021.
//

import UIKit
import Foundation

class LaunchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "LaunchCellIdentifier"
    var launches: [LaunchElement?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LaunchCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        guard let request = try? getAllLaunches.init() else {
            fatalError("Unable to create task getAllLaunches")
        }
        
        APIManager.shared.getJsonRequest(
            withRequest: request,
            completionHandler: { [weak self] (data) in
                do {
                    self?.launches = try JSONDecoder().decode([LaunchElement].self, from: data!)
                    self?.tableView.reloadData()
                } catch {
                   print(error)
                }
                
            }, errorHandler: { (error) in
                print(error)
            }, loadingHandler: { (show) in
                
            }
        )
    }
}

extension LaunchViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchCellIdentifier", for: indexPath) as? LaunchCell else {
            fatalError("Unable to dequeue \(cellIdentifier)")
        }

        guard let launch = launches[indexPath.row] else {
            return cell
        }
        cell.prepareForReuse()
        
        cell.successSwitch = launch.success
        cell.launchLabel.text = launch.name
        cell.staticFireLabel.text = launch.dateUtc
        return cell
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
