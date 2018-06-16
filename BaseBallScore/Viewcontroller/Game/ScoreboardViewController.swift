//
//  ScoreboardViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/05.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController, ModalViewControllerDelegate{

    @IBOutlet weak var scoreboardTableUIView: UIView!
    @IBOutlet weak var opponentLabel: UILabel!
    var registStartingLineupTableViewController: RegistStartingLineupTableViewController!
    
    var game:Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opponentLabel.text = game.opponent
        opponentLabel.sizeToFit()
//        for order:Order in game.orders {
//            print(order.player.name)
//        }
        
        let storyboard = UIStoryboard(name: "ScoreboardTableView", bundle: nil)
        let childViewController: ScoreboardTableViewController = storyboard.instantiateViewController(withIdentifier: "ScoreboardTableViewController") as! ScoreboardTableViewController
        
//        childViewController.tableView.register(ScoreboardTableViewCell.self, forCellReuseIdentifier: "ScoreboardTableViewCell")
        childViewController.game = game
        addChildViewController(childViewController)
        scoreboardTableUIView.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registStartingLineup(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistStartingLineup", bundle: nil)
        registStartingLineupTableViewController = storyboard.instantiateViewController(withIdentifier: "RegistStartingLineupTableViewController") as! RegistStartingLineupTableViewController
        registStartingLineupTableViewController.game = game
        self.present(registStartingLineupTableViewController, animated: true, completion: nil)
        registStartingLineupTableViewController.delegate = self
        
    }
    func finishModal() -> Void {
        self.registStartingLineupTableViewController.dismiss(animated: true, completion: nil)
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
