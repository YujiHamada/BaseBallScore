//
//  ScoreboardViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/05.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController{

//    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var opponentLabel: UILabel!
    
    var game:Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opponentLabel.text = game.opponent
        opponentLabel.sizeToFit()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
