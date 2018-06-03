//
//  Team.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/04/28.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation

class Team: RealmUtilObject {
    @objc dynamic var id:String =  NSUUID().uuidString
    @objc dynamic var name:String?
    @objc dynamic var created: Double = NSDate().timeIntervalSince1970
    @objc dynamic var updated: Double = NSDate().timeIntervalSince1970
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
