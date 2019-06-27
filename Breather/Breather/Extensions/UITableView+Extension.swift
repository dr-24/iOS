//
//  UITableView+Extension.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

extension UITableView {
    func cell<T: UITableViewCell>(for cellType: T.Type) -> T where T : NibLodable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.nibId) as? T else {
            fatalError("Could not find cell with reuseID \(T.nibId)")
        }
        return cell
    }
}

