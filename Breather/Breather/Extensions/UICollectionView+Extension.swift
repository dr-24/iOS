//
//  UICollectionView+Extension.swift
//  Breather
//
//  Created by 강수진 on 28/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

extension UICollectionView {
    func cell<T: UICollectionViewCell>(type cellType: T.Type, for indexPath : IndexPath) -> T where T : NibLodable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.nibId, for: indexPath) as? T else {
            fatalError("Could not find cell with reuseID \(T.nibId)")
        }
        return cell
    }
    
    
}
