//
//  ManagePlayersTabViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/12.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class ManagePlayersTabViewController: ModalViewController, ModalViewControllerDelegate {
    
    var registerNewPlayersViewController: RegistNewPlayerViewController! = nil
    var manageTeamViewController: ManageTeamViewController! = nil
    
    @IBAction func showPlayersTable(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PlayersTable", bundle: nil)
        let playersTableViewController = storyboard.instantiateViewController(withIdentifier: "PlayersTableViewController")
        self.navigationController?.pushViewController(playersTableViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showRegisterModal(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        registerNewPlayersViewController = storyboard.instantiateViewController(withIdentifier: "RegisterNewPlayerViewController") as! RegistNewPlayerViewController
        registerNewPlayersViewController.delegate = self
        self.present(registerNewPlayersViewController, animated: true, completion: nil)
    }
    
    func finishModal(registerd: Bool) {
        self.registerNewPlayersViewController.dismiss(animated: true, completion: nil)
        if registerd {
            let alert: UIAlertController = UIAlertController(title: "選手登録が完了しました", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func showManageTeam(_ sender: Any) {
//        let storyboard: UIStoryboard = self.storyboard!
        let storyboard = UIStoryboard(name: "ManageTeam", bundle: nil)
        manageTeamViewController = storyboard.instantiateViewController(withIdentifier: "ManageTeamViewController") as! ManageTeamViewController
//        manageNewPlayersViewController.delegate = self
        self.navigationController?.pushViewController(manageTeamViewController, animated: true)
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
