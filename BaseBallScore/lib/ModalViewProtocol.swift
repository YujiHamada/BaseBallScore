//
//  ModalViewProtocol.swift
//  BaseBallScore
//
//  Created by 濱田裕史 on 2018/05/05.
//  Copyright © 2018年 濱田裕史. All rights reserved.
//

import Foundation

@objc protocol ModalViewControllerDelegate {
    @objc optional func finishModal() -> Void
    @objc optional func finishModal(registerd: Bool) ->Void
}
