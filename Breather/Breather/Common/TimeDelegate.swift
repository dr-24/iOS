//
//  TimeDelegate.swift
//  Breather
//
//  Created by 강수진 on 28/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation

protocol TimeDelegate {
    func getDayIntervalsFromToday(comepareWith timeStamp : Int) -> Int
}

extension TimeDelegate {
    func getDayIntervalsFromToday(comepareWith timeStamp : Int) -> Int {
        let dateFormatter = DateFormatter(timeZone: "UTC", dateFormat: "yyyy-MM-dd")
        let todayString = Date().millisecondsSince1970.timeStampToDate(dateFormat: "yyyy-MM-dd")
        let compareString = timeStamp.timeStampToDate(dateFormat: "yyyy-MM-dd")
        if let compareDay = dateFormatter.date(from: compareString), let today = dateFormatter.date(from: todayString) {
            let intervalDays = Int(today.timeIntervalSince(compareDay) / 86400)
            return intervalDays
        }
        
        return -1
    }
}
