//
//  launchCellController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 14.09.2021.
//

import Foundation
import UIKit
import AlamofireImage


class LaunchCell: UITableViewCell {

    @IBOutlet private weak var successLabel: UILabel!
    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var staticFireLabel: UILabel!
    @IBOutlet private weak var pictureImageView: UIImageView!

    var imageURL: String? {
        didSet {
            if imageURL != nil,
               let url = URL(string:imageURL!){
                pictureImageView.af.setImage(withURL: url)
            }
        }
    }
    
    var successSwitch: Bool = true {
        didSet {
            if successSwitch {
                successLabel.text = "🟢"
            }else {
                successLabel.text = "🔴"
            }
        }
    }
  override func prepareForReuse() {
    super.prepareForReuse()
    
    successLabel.text = nil
    launchLabel.text = nil
    staticFireLabel.text = nil
    pictureImageView.image = nil
  }
}
