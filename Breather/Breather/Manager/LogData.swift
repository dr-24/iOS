//
//  LogData.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class LogData {
    static let shared: LogData = LogData()
    let realm = try! Realm()
}
