//
//  ScoreFieldViewController.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/06/11.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import UIKit

class ScoreFieldViewController: UIViewController, UIGestureRecognizerDelegate {

    var delegate: ModalViewControllerDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        tapRecognizer.delegate = self
        view.addGestureRecognizer(tapRecognizer)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func close() {
        delegate.finishModal!()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view == self.view {
            return true
        }
        return false
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
