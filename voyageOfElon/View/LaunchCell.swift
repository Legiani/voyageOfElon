//
//  launchCellController.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 14.09.2021.
//

import Foundation
import UIKit


class LaunchCell: UITableViewCell {

    @IBOutlet weak var success: UILabel!
    @IBOutlet weak var ship: UILabel!
    @IBOutlet weak var staticFire: UILabel!
    @IBOutlet weak var picture: UIImageView!

  override func prepareForReuse() {
    super.prepareForReuse()
    
    success.text = nil
    ship.text = nil
    staticFire.text = nil
    picture.image = nil
  }
}
