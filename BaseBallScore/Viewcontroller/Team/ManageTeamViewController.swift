//
//  TeamManageViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/28.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit
import RealmSwift

class ManageTeamViewController: UIViewController {
    @IBOutlet weak var teamText: UITextField!
    
    var team:Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        
        let realm = try! Realm()
        let teams: Results<Team> = realm.objects(Team.self)
        if let team = teams.first{
            teamText.text = team.name
        }
        
        teamText.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func register(_ sender: Any) {
        let team = Team()
        team.name = teamText.text
        team.save()
        
        let alert: UIAlertController = UIAlertController(title: "チーム登録を完了しました", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
