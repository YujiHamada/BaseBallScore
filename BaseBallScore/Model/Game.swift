//
//  Game.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/29.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation
import  RealmSwift

class Game: RealmUtilObject {
    @objc dynamic var id:String =  NSUUID().uuidString
    @objc dynamic var opponent:String?
    @objc dynamic var date:Date?
    var is_bat_first:Bool?
    let scores = List<Score>()
    let orders = List<Order>()
    let battingResult = List<BattingResult>()
    @objc dynamic var created: Double = NSDate().timeIntervalSince1970
    @objc dynamic var updated: Double = NSDate().timeIntervalSince1970
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func appnedOrder(order: Order) -> Void{
        let realm = try! Realm()
        try! realm.write {
            self.orders.append(order)
        }
    }
}
