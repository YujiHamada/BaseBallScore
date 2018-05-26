//
//  StartingLineupTableViewCell.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/05.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class StartingLineupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var positionTextField: StartingLineupCellTextField! = StartingLineupCellTextField()
    @IBOutlet weak var playerNameTextField: StartingLineupCellTextField! = StartingLineupCellTextField()
    @IBOutlet weak var battingOrderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        positionTextField.placeholder = "ポジション"
        playerNameTextField.placeholder = "選手"
        playerNameTextField.tag = 1
        positionTextField.tag = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class StartingLineupCellTextField : UITextField {
    var playerID: String?
}
