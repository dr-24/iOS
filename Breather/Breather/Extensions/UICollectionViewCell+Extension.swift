//
//  UICollectionViewCell+Extension.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func makeCornerRound(cornerRadius : CGFloat){
        self.contentView.layer.cornerRadius = cornerRadius
//        self.contentView.layer.borderWidth = 0.5
//        self.contentView.layer.borderColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        
        
    }
}
