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

extension UICollectionView {
    func cell<T: UICollectionViewCell>(type cellType: T.Type, for indexPath : IndexPath) -> T where T : NibLodable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.nibId, for: indexPath) as? T else {
            fatalError("Could not find cell with reuseID \(T.nibId)")
        }
        return cell
    }
    
   
}

//
//if let cell: MainFirstCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainSecondCVCell.reuseIdentifier, for: indexPath) as? MainSecondCVCell{
//    if let recommendPlaceData_ = recommendPlaceData {
//        cell.configure(data: recommendPlaceData_[indexPath.row])
//    }
//    return cell
