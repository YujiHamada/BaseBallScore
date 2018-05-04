//
//  StartGameViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/29.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class StartGameViewController: ModalViewController {
   
    @IBOutlet weak var opponent: UITextField!
    @IBOutlet weak var date: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        toolBar.setItems([doneButton], animated: true)
        
        date.inputAccessoryView = toolBar
        opponent?.inputAccessoryView = toolBar
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        date.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy-MM-dd";
        date.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func donePicker() {
        date.resignFirstResponder()
        opponent?.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
        self.delegate.finishModal!()
    }
    
    @IBAction func regist(_ sender: Any) {
        let game = Game()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        game.date = dateFormatter.date(from: (date?.text)!)
        game.opponent = opponent.text
        game.save()
        
        let alert: UIAlertController = UIAlertController(title: "試合登録が完了しました", message: nil, preferredStyle: UIAlertControllerStyle.alert)
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
