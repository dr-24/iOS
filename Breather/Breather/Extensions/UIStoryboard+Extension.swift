//
//  UIStoryboard+Extension.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func viewController<T>(_ type: T.Type) -> T where T : NibLodable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.nibId) as? T else {
            fatalError("Could not find viewController \(T.nibId)")
        }
        
        return viewController
    }
    
}
