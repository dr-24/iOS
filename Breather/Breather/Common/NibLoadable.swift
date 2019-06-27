//
//  NibLoadable.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation


protocol NibLodable: class {
    static var nibId: String { get }
}

extension NibLodable {
    
    static var nibId: String {
        return String(describing: self)
    }
    
    var nidId: String {
        return String(describing: type(of: self))
    }
    
}

