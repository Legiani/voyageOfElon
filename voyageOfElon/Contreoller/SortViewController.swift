//
//  SortViewController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 16.09.2021.
//

import Foundation
import UIKit

struct SortObject {
    
    let id: Int
    let label: String
    let keyPath: AnyKeyPath
    
    init(id: Int, label: String, keyPath: AnyKeyPath) {
        self.id = id
        self.label = label
        self.keyPath = keyPath
    }
}

class SortViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "SortCellIdentifier"

    var sortOptions = [
        SortObject.init(id: 0, label: "Název", keyPath: \LaunchElement.name),
        SortObject.init(id: 1, label: "Start", keyPath: \LaunchElement.dateUnix),
        SortObject.init(id: 2, label: "Úspěch ", keyPath: \LaunchElement.success)
    ]
    var selectedSortId: Int = 1
    var callBackBlock : ((AnyKeyPath) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedSortId = 1
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.allowsMultipleSelection = false

        tableView.register(UINib(nibName: "SortCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let selected = sortOptions[selectedSortId].keyPath
        callBackBlock!(selected)
    }
}

extension SortViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SortObjectCell else {
            fatalError("Unable to dequeue \(cellIdentifier)")
        }

        let options = sortOptions[indexPath.row]
        cell.title.text = options.label

        cell.accessoryType = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        selectedSortId = indexPath.row
        
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
