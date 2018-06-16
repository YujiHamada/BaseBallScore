//
//  BattingResult.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/06/10.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation

enum Batting:String, EnumEnumerable{
    case Grounder = "ゴロ"
    case Fly = "フライ"
    case StrikeOut = "三振"
    case Walk = "四球"
    case HitByPitch = "死球"
    case Single = "ヒット"
    case Double = "ツーベースヒット"
    case Triple = "スリーベースヒット"
    case HomeRun = "ホームラン"
    case Bunt = "犠打"
    case SacrificeFly = "犠飛"
    case DoublePlay = "ダブルプレー"
    case TriplePlay = "トリプルプレー"
    case error = "エラー"

}
