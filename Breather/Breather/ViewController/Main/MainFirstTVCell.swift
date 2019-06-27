//
//  MainFirstTVCell.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

class MainFirstTVCell: UITableViewCell, NibLodable {
    
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    let smokingSavedData : [SmokingSaveType] = [.chicken, .coffee, .money, .sleep]
    var smokingInfo : [SmokingData] = []
    
    var finalOffset : CGFloat = 0
    var startOffset  : CGFloat = 0
    var currentIdx = 0
    var firstShown = true
    
    func updateUI(){
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8352941176, green: 0.8352941176, blue: 0.8352941176, alpha: 1)
        
        countLbl.text = smokingInfo.count.description + " 개피"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.smokingInfo = LogManager.shared.getSmokingData().map{$0}
        updateUI()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MainFirstTVCell : UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smokingSavedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cell(type: MainFirstCVCell.self, for: indexPath)
        
        if firstShown {
            cell.backView.backgroundColor = #colorLiteral(red: 0, green: 0.3843137255, blue: 1, alpha: 1)
            firstShown = !firstShown
        }
        
        let smokingCount = smokingInfo.count
        let smokingDuration = smokingInfo.reduce(0) { (result, data) in
            result + data.smokingDuration
        }
        cell.configure(type: smokingSavedData[indexPath.row], smokingCount : smokingCount, smokingDuration : smokingDuration)
        return cell
    }
}


//MARK: - 컬렉션 뷰 드래깅
extension MainFirstTVCell : UIScrollViewDelegate {
    
    private func changeCellColor(_ currentIdx : Int, isPrev : Bool){
        let indexPath = IndexPath(row: currentIdx, section: 0)
        let cell = collectionView.cellForItem(at: indexPath) as? MainFirstCVCell
        cell?.backView.backgroundColor = isPrev ? .white : #colorLiteral(red: 0, green: 0.3843137255, blue: 1, alpha: 1)
    }
    
    enum Direction {
        case right
        case left
    }

    /**
     현재 메인셀의 인덱스를 구하는 함수
     */
    private func indexOfMajorCell(direction : Direction) -> Int {
        changeCellColor(currentIdx, isPrev: true)
        var index = 0
        switch direction {
        case .right :
            index = currentIdx + 1
        case .left :
            index = currentIdx - 1
        }
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        currentIdx = safeIndex
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            guard let self = self else {
                return
            }
            self.changeCellColor(self.currentIdx, isPrev: false)
        }
       
        return safeIndex
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffset = collectionView.contentOffset.x
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        finalOffset = collectionView.contentOffset.x
        //stop scrollview sliding
        targetContentOffset.pointee = scrollView.contentOffset
        if finalOffset > startOffset {
            //뒤로 넘기기
            let nextIdx = indexOfMajorCell(direction: .right)
            self.pageControl.currentPage = nextIdx
            let indexPath = IndexPath(row: nextIdx, section: 0)
            
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else if finalOffset < startOffset {
            //앞으로 가기
            let nextIdx = indexOfMajorCell(direction: .left)
            self.pageControl.currentPage = nextIdx
            let indexPath = IndexPath(row: nextIdx, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
