//
//  MainThirdTVCell.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

class MainThirdTVCell: UITableViewCell, NibLodable, TimeDelegate {
    
    enum Day {
        case today
        case yesterday
        case past
    }
    
    enum Week : Int{
        case sun
        case mon
        case tue
        case wed
        case thur
        case fri
        case sat
        
        var weekString : String {
            switch self {
            case .sun:
                return "일요일"
            case .mon:
                return "월요일"
            case .tue:
                return "화요일"
            case .wed:
                return "수요일"
            case .thur:
                return "목요일"
            case .fri:
                return "금요일"
            case .sat:
                return "일요일"
            }
        }
    }

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var currentSmokingLbl: UILabel!
    
    func configure(data : SmokingData) {
        let date = data.smokingTime.timeStampToDate(dateFormat: "MM월 dd일")
        let weekInfo = getWeekInfo(timeStamp: data.smokingTime)
        let weekDay = getWeekDayName(weekInfo.weekday)
        
        dateLbl.text = "\(date) \(weekDay.weekString)"
        timeLbl.text = data.smokingTime.timeStampToDate(dateFormat: "hh:mm")
        switch passedDay(timeStamp: data.smokingTime) {
        case .today:
            currentSmokingLbl.text = "Today"
             currentSmokingLbl.isHidden = false
        case .yesterday:
            currentSmokingLbl.text = "Yesterday"
            currentSmokingLbl.isHidden = false
        case .past:
            currentSmokingLbl.isHidden = true
        }
    }
    
    private func passedDay(timeStamp : Int) -> Day {
        let intervalDays = getDayIntervalsFromToday(comepareWith: timeStamp)

        switch intervalDays {
        case 0 :
            return .today
        case 1 :
            return .yesterday
        default :
            return .past
        }
    }
    
    private func getWeekInfo(timeStamp : Int) -> (weekday : Int, weekOfMonth : Int) {
        let dateFormatter = DateFormatter(timeZone: "UTC", dateFormat: "yyyy-MM-dd hh:mm")
        guard let smokingDay = dateFormatter.date(from: timeStamp.timeStampToDate(dateFormat: "yyyy-MM-dd hh:mm")) else {return (0,0)}
        let calendar = Calendar(identifier: .gregorian)
        let week = calendar.dateComponents([.weekday, .weekOfMonth], from: smokingDay)
        return (week.weekday ?? 0, week.weekOfMonth ?? 0)
    }
    
    private func getWeekDayName(_ week : Int) -> Week{
        switch week {
        case 1:
            return .sun
        case 2:
            return .mon
        case 3:
            return .tue
        case 4:
            return .wed
        case 5:
            return .thur
        case 6:
            return .fri
        case 7:
            return .sat
        default:
            return .sun
        }
    }
}
