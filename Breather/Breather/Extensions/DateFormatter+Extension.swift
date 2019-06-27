
//
//  DateFormatter+Extension.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation
extension DateFormatter {
    convenience init(timeZone : String = "KST", dateFormat : String = "yyyy-MM-dd hh:mm"){
        self.init()
        self.timeZone = TimeZone(abbreviation: timeZone) //Set timezone that you want
        self.locale = NSLocale.current
        self.dateFormat = dateFormat
    }
}
