//
//  DetailViewController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 17.09.2021.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var launch: LaunchElement! = nil
    
    @IBOutlet weak var missionImage: UIImageView!
    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var launchTime: UILabel!
    @IBOutlet weak var rocketName: UILabel!
    
    override func viewDidLoad() {
        loadRocked(id: launch.rocket)

        let urlString = launch.links.patch.small
        if let url = URL(string: urlString){
            missionImage.af.setImage(withURL: url)
        }

        missionName.text = launch.name
        launchTime.text = launch.staticFireDateUtc
    }
    
    func loadRocked(id: String) {
        let request = getRocket(id: id)
        APIManager.shared.getJsonRequest(
            withRequest: request,
            completionHandler: { [weak self] (data) in
                do {
                    let recived = try JSONDecoder().decode(Rocket.self, from: data!)
                    self?.rocketName.text = recived.name
                    
                } catch {
                   print(error)
                }
                
            }, errorHandler: { (error) in
                self.showError(text: error.localizedDescription)
            }, loadingHandler: { (show) in
                
            }
        )
    }
}
