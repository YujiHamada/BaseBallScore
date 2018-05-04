//
//  RegisterNewPlayerViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/07.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit
import RealmSwift

class RegistNewPlayerViewController: ModalViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var mainPosition: UITextField!
    @IBOutlet weak var subPosition: UITextField!
    @IBOutlet weak var selectThrow: UITextField!
    @IBOutlet weak var selectBatting: UITextField!
    @IBOutlet weak var uniformNumberLabel: UITextField!
    @IBOutlet weak var note: UITextField!
    
    let positions = ["投手", "捕手", "内野手", "外野手"]
    let pitchings = ["右投げ", "左投げ"]
    let battings = ["右打ち", "左打ち", "両打ち"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        toolBar.setItems([doneButton], animated: true)
        
        let mainPositionPickerView = UIPickerView()
        mainPositionPickerView.tag = 0
        mainPositionPickerView.delegate = self
        mainPosition.inputView = mainPositionPickerView
        mainPosition.inputAccessoryView = toolBar
        
        let subPositionPickerView = UIPickerView()
        subPositionPickerView.tag = 1
        subPositionPickerView.delegate = self
        subPosition.inputView = subPositionPickerView
        subPosition.inputAccessoryView = toolBar
        
        let pittingsPickerView = UIPickerView()
        pittingsPickerView.tag = 2
        pittingsPickerView.delegate = self
        selectThrow.inputView = pittingsPickerView
        selectThrow.inputAccessoryView = toolBar
        
        let battingPickerView = UIPickerView()
        battingPickerView.tag = 3
        battingPickerView.delegate = self
        selectBatting.inputView = battingPickerView
        selectBatting.inputAccessoryView = toolBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func close(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        self.delegate.finishModal!(registerd: false)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 || pickerView.tag == 1 {
            return positions.count
        } else if pickerView.tag == 2 {
            return pitchings.count
        } else {
            return battings.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 || pickerView.tag == 1 {
            return positions[row]
        } else if pickerView.tag == 2 {
            return pitchings[row]
        } else {
            return battings[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            mainPosition.text = "\(positions[row])"
        } else if pickerView.tag == 1 {
            subPosition.text = "\(positions[row])"
        } else if pickerView.tag == 2 {
            selectThrow.text = "\(pitchings[row])"
        } else {
            selectBatting.text = "\(battings[row])"
        }
        
    }
    @IBAction func register(_ sender: Any) {
        let player = Player()
        
        player.name = nameLabel.text
        player.mainPosition = mainPosition.text
        player.subPosition = subPosition.text
        player.uniformNumber = uniformNumberLabel.text
        player.pitting = selectThrow.text
        player.batting = selectBatting.text
        player.note = note.text
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(player)
        }
        self.delegate.finishModal!(registerd: true)
    }
    
    @objc func donePicker() {
        mainPosition.resignFirstResponder()
        subPosition.resignFirstResponder()
        selectThrow.resignFirstResponder()
        selectBatting.resignFirstResponder()
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
