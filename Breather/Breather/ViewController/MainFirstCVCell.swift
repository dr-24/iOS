//
//  MainFirstCVCell.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

class MainFirstCVCell: UICollectionViewCell, NibLodable {
   
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(type : SmokingSaveType){

       
        titleLabel.text = "\(type.typeName) 3 \(type.unitName)"
        imgView.image = type.img
    }
    override func awakeFromNib() {
        self.makeCornerRound(cornerRadius: 40)
    }
}
