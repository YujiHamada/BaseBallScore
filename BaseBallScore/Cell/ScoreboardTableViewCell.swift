//
//  ScoreboardTableViewCell.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/06/10.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class ScoreboardTableViewCell: UITableViewCell {
    @IBOutlet weak var inningLabel: UILabel!
    @IBOutlet weak var batFirstButton: UIButton!
    @IBOutlet weak var fieldFirstButton: UIButton!
    
    var scoreboardTableViewController: ScoreboardTableViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showScoreField(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistScoreDetail", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "RegistScoreDetailTableViewController")
        scoreboardTableViewController.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
}
