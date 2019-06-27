//
//  Int+Extension.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation


extension Int{
    func timeStampToDate(timeZone : String = "KST", dateFormat : String = "yyyy-MM-dd hh:mm") -> String{
        let unixTimestamp = (self)
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp/1000))
        let dateFormatter = DateFormatter(timeZone: timeZone, dateFormat: dateFormat)
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}
