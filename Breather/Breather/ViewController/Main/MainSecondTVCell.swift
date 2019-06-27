//
//  MainSecondTVCell.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

class MainSecondTVCell: UITableViewCell, NibLodable {

    @IBOutlet weak var weekOfMonthLbl: UILabel!
    
    func configure(timeStamp : Int) {
        let weekInfo = getWeekInfo(timeStamp: timeStamp)
        weekOfMonthLbl.text = "\(weekInfo.month)월 \(weekInfo.weekOfMonth)째 주 흡연"
    }
    
    private func getWeekInfo(timeStamp : Int) -> (month : Int, weekOfMonth : Int) {
        let dateFormatter = DateFormatter(timeZone: "UTC", dateFormat: "yyyy-MM-dd hh:mm")
        guard let smokingDay = dateFormatter.date(from: timeStamp.timeStampToDate(dateFormat: "yyyy-MM-dd hh:mm")) else {return (0,0)}
        let calendar = Calendar(identifier: .gregorian)
        let week = calendar.dateComponents([.weekOfMonth, .month], from: smokingDay)
        return (week.month ?? 0, week.weekOfMonth ?? 0)
    }
}
