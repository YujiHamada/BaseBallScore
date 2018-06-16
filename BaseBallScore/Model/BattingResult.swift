//
//  battingResult.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/06/10.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation
import  RealmSwift

class BattingResult: RealmUtilObject {
    @objc dynamic var id:String =  NSUUID().uuidString
    var game = LinkingObjects(fromType: Game.self, property: "battingResult")
    var player:Player!
    var inning:Int!
    var rbi:Int?
    var position:Postion?
    var result: Batting!
    var round = 1 // 何巡目か？ほとんど１なので最初から１を設定しておく
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
