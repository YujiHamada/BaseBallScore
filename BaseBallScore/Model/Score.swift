//
//  Score.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/06/03.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation
import  RealmSwift

class Score: RealmUtilObject {
    @objc dynamic var id:String =  NSUUID().uuidString
    
    let game = LinkingObjects(fromType: Game.self, property: "scores")
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
