//
//  RegistStartingLineupTableViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/05.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit
import RealmSwift

class RegistStartingLineupTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var players:Results<Player> = Player.getAll()
    var game:Game!
    let positions = Postion.cases
    let toolBar:UIToolbar = UIToolbar()
    let positionPickerView = UIPickerView()
    let battingOrderPickerView = UIPickerView()
    var battingOrderArray:Array<Int>?
    var currentPickingTextView: StartingLineupCellTextField?
    var orders: Dictionary<Int, Order> = [:]
    var gameID: String!
    var delegate: ModalViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        toolBar.setItems([doneButton], animated: true)

        positionPickerView.tag = 0
        positionPickerView.delegate = self
        
        battingOrderPickerView.tag = 1
        battingOrderPickerView.delegate = self
        
        battingOrderArray = Array(1...players.count)
        
//        let orders:Results<Order> = Order.getAll()
//        print(orders.count)
//        for order:Order in orders {
//            print(order.id)
//        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return positions.count + 1
        } else {
            return players.count + 1
        }
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if row == 0 {
            return "-"
        }
        
        if pickerView.tag == 0 {
            return positions[row - 1].name()
        } else {
            return players[row - 1].name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 0 {
            return
        }
        
        if currentPickingTextView?.tag == 0 {
            currentPickingTextView?.text = "\(positions[row - 1].name())"
        }else {
            currentPickingTextView?.text = "\(players[row - 1].name!)"
            currentPickingTextView?.playerID = players[row - 1].id
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField:UITextField) {
        currentPickingTextView = textField as? StartingLineupCellTextField
    }
    
    @IBAction func insertRows(_ sender: Any) {
        
    }
    
    @IBAction func regist(_ sender: Any) {
        for sectionNumber in 0...tableView.numberOfSections-1 {
            for rowNumber in 0...tableView.numberOfRows(inSection: sectionNumber)-1 {
                if let cell: StartingLineupTableViewCell = tableView.cellForRow(at: IndexPath(row: rowNumber, section: sectionNumber)) as? StartingLineupTableViewCell{

                    if !(cell.playerNameTextField.text?.isEmpty ?? true) && !(cell.positionTextField.text?.isEmpty ?? true){
                        let order: Order = Order();
                        order.game = game
                        order.player = cell.player
                        order.positon = Postion.getByName(name: cell.positionTextField.text!)?.rawValue
                        order.batting_order = rowNumber
                        order.save()
                    }
                    
                }
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "出場選手登録が完了しました", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        delegate.finishModal!()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (players.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StartingLineupTableViewCell", for: indexPath) as! StartingLineupTableViewCell
        
        cell.battingOrderLabel.text = String(indexPath.row + 1)
        cell.battingOrderLabel.sizeToFit()
        cell.player = players[indexPath.row]
        
        cell.playerNameTextField.inputAccessoryView = toolBar
        cell.playerNameTextField.inputView = battingOrderPickerView
        cell.playerNameTextField.delegate = self

        cell.positionTextField.inputAccessoryView = toolBar
        cell.positionTextField.inputView = positionPickerView
        cell.positionTextField.delegate = self
        
        cell.tag = indexPath.row
        
        return cell
    }
    
    
    @objc func donePicker(){
        currentPickingTextView?.endEditing(true)
    }
    
    @IBAction func close(_ sender: Any) {
        delegate.finishModal!()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
