//
//  BlueEar.swift
//  Breather
//
//  Created by 강수진 on 28/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation

protocol BlueEar {
    func didConnectPeripheral(name: String?)
    func didDisconnectPeripheral(name: String?)
}
