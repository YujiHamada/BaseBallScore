//
//  RegistScoreDetailTableViewCell.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/06/13.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class RegistScoreDetailTableViewCell: UITableViewCell, ModalViewControllerDelegate {
    @IBOutlet weak var battingOrderLabel: UILabel!
    @IBOutlet weak var batterNameLabel: UILabel!
    
    var scoreFieldViewController: ScoreFieldViewController?
    
    var registScoreDetailTableviewController: RegistScoreDetailTableViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func modaltest(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ScoreField", bundle: nil)
        scoreFieldViewController = storyboard.instantiateViewController(withIdentifier: "ScoreFieldViewController") as? ScoreFieldViewController
        scoreFieldViewController?.modalTransitionStyle = .crossDissolve
        scoreFieldViewController?.delegate = self
        registScoreDetailTableviewController.present(scoreFieldViewController!, animated: true, completion: nil)
    }
    
    func finishModal() -> Void {
        scoreFieldViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
