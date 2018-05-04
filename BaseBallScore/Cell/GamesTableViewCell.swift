//
//  GamesTableViewCell.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/04.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var opponent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
