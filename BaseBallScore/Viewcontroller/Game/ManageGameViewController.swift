//
//  GameViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/29.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit
import RealmSwift

class ManageGameViewController: UIViewController, ModalViewControllerDelegate {
    
    var startGameViewController:StartGameViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let realm = try! Realm()
//        try! realm.write {
//            let game = realm.objects(Game.self)
//            realm.delete(game)
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showStartGame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StartGame", bundle: nil)
        startGameViewController = storyboard.instantiateViewController(withIdentifier: "StartGameViewController") as? StartGameViewController
        startGameViewController?.delegate = self
        let navigationController = UINavigationController(rootViewController: startGameViewController!)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func finishModal() {
        startGameViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showGamesTabel(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "GamesTable", bundle: nil)
        
        let gamesTableViewController = storyboard.instantiateViewController(withIdentifier: "GamesTableViewController")
        
        self.navigationController?.pushViewController(gamesTableViewController, animated: true)
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
