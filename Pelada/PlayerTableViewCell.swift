//
//  PlayerTableViewCell.swift
//  Pelada
//
//  Created by El Capitan on 7/18/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerFoot: UILabel!
    @IBOutlet weak var initials: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var positionView: UIView!
    @IBOutlet weak var playerFootView: UIView!
    @IBOutlet weak var playerRatingView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
