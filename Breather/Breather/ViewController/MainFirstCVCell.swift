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
    
    func configure(type : SmokingSaveType, smokingCount : Int,  smokingDuration : Int){
        titleLabel.text = "\(type.typeName) \(getMiddleString(type: type, count: smokingCount, duration: smokingDuration)) \(type.unitName)"
        imgView.image = type.img
    }
    
    override func awakeFromNib() {
        self.makeCornerRound(cornerRadius: 40)
    }
    
    func getMiddleString(type : SmokingSaveType, count : Int, duration : Int) -> String {
        switch type {
        case .money, .chicken, .coffee:
            return String(format: "%.1f", Double(count*225)/Double(type.unit))
        case .sleep:
            return String(format: "%.1f", Double(duration)/Double(type.unit))
        @unknown default:
            return ""
        }
    }
}
