//
//  Order.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/13.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation
import  RealmSwift

class Order: RealmUtilObject {
    @objc dynamic var id:String =    NSUUID().uuidString
//    @objc dynamic var game:Game!
    @objc dynamic var player:Player!
    let game = LinkingObjects(fromType: Game.self, property: "orders")
    var positon:Int!
    var batting_order:Int!
    @objc dynamic var created: Double = NSDate().timeIntervalSince1970
    @objc dynamic var updated: Double = NSDate().timeIntervalSince1970
    
    static func getAll()->Results<Order>{
        let realm = try! Realm()
        return realm.objects(Order.self)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
