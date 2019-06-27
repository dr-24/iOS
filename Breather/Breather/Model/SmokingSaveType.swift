//
//  SmokingSaveType.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

enum SmokingSaveType {
    case money
    case chicken
    case coffee
    case sleep
    
    var typeName : String {
        switch self {
        case .money:
            return "저축"
        case .chicken:
            return "치킨"
        case .coffee:
            return "커피"
        case .sleep:
            return "잠"
            
        }
    }
    
    var unitName : String {
        switch self {
        case .money:
            return "만원"
        case .chicken:
            return "마리"
        case .coffee:
            return "잔"
        case .sleep:
            return "시간"
            
        }
    }
    
    var unit : Int {
        switch self {
        case .money:
            return 10000
        case .chicken:
            return 17000
        case .coffee:
            return 3000
        case .sleep:
            return 60
            
        }
    }
    
    var img : UIImage {
        switch self {
        case .money:
            return #imageLiteral(resourceName: "money")
        case .chicken:
            return #imageLiteral(resourceName: "chicken")
        case .coffee:
            return #imageLiteral(resourceName: "coffee")
        case .sleep:
            return #imageLiteral(resourceName: "sleep")
        }
    }
}
