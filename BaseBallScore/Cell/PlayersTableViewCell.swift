//
//  PlayersTableViewCell.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/12.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
