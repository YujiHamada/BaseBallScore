//
//  RealmUtilObject.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/26.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation
import  RealmSwift

class RealmUtilObject: Object {
    
    func save() -> Void{
        let realm = try! Realm()
        try! realm.write {
            realm.add(self, update: true)
        }
    }
    
//    static func getAll()->Results<self.cla>{
//        let realm = try! Realm()
//        return realm.objects(Player.self)
//    }
    
    func deleteAll() {
//        self.getAll()
    }
}
