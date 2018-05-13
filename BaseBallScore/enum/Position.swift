//
//  Position.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/05.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation

enum Postion:Int, EnumEnumerable{
    case Pitcher = 1
    case Catcher = 2
    case First = 3
    case Second = 4
    case Third = 5
    case Shortstop = 6
    case LeftFielder = 7
    case CenterFielder = 8
    case RightFielder = 9
    
    func name()->String{
        switch self {
        case .Pitcher:
            return "投手";
        case .Catcher:
            return "捕手";
        case .First:
            return "ファースト";
        case .Second:
            return "セカンド";
        case .Third:
            return "サード";
        case .Shortstop:
            return "ショート";
        case .LeftFielder:
            return "レフト";
        case .CenterFielder:
            return "センター";
        case .RightFielder:
            return "ライト";
        }
    }
}


