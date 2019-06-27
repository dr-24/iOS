//
//  LogManager.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class LogManager {
    
    static let shared = LogManager()
    
    func addData(data : SmokingData){
        try! LogData.shared.realm.write {
            LogData.shared.realm.add(data)
        }
    }
    func getSmokingData() -> Results<SmokingData>{
        return LogData.shared.realm.objects(SmokingData.self)
    }
}
