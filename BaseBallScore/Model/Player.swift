//
//  Player.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/10.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation
import RealmSwift

class Player: RealmUtilObject {
    
    @objc dynamic var id:String =  NSUUID().uuidString
    @objc dynamic var name:String!
    @objc dynamic var mainPosition:String?
    @objc dynamic var subPosition:String?
    @objc dynamic var uniformNumber:String?
    @objc dynamic var pitting:String?
    @objc dynamic var batting:String?
    @objc dynamic var note:String?
    @objc dynamic var created: Double = NSDate().timeIntervalSince1970
    @objc dynamic var updated: Double = NSDate().timeIntervalSince1970
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
