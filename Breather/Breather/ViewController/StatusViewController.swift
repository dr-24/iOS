//
//  StatusViewController.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit
import Charts

class StatusViewController: UIViewController, ChartViewDelegate, TimeDelegate{

    @IBOutlet var chartView: BarChartView!
    @IBOutlet weak var thisWeekCountLabel: UILabel!
    @IBOutlet weak var todayCountLabel: UILabel!
    @IBOutlet weak var avgPerDayLabel: UILabel!
    @IBOutlet weak var bleImgView: UIImageView!
    @IBOutlet weak var bleConnectBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chartView.animate(yAxisDuration: 1)
        setupUI()
    }
    
    func setupUI(){
        setBottomLabels()
        setChartDataCount()
    }
    
    
    func setupChartView(){
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        chartView.maxVisibleCount = 60
        chartView.pinchZoomEnabled = false
        chartView.drawBarShadowEnabled = false
        chartView.setScaleEnabled(false)
        chartView.highlightFullBarEnabled = false
        
        chartView.gridBackgroundColor = .black
        chartView.backgroundColor = .white
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        chartView.legend.enabled = false
        chartView.tintColor = .red
        
        chartView.animate(yAxisDuration: 1)
        
        chartView.rightAxis.axisLineColor = .white
        chartView.xAxis.axisLineColor = .white
        chartView.leftAxis.axisLineColor = .clear
        chartView.leftAxis.labelTextColor = .black
        chartView.rightAxis.labelTextColor = .clear
        chartView.xAxis.labelTextColor = .clear
    }
   
    func getWeekData() -> [String : Int] {
        let smokingVals = LogManager.shared.getSmokingData().sorted(byKeyPath: "smokingTime", ascending: false).map{$0}
    
        var weekDic : [String : Int] = ["0" : 0, "1" : 0, "2" : 0, "3" : 0, "4" : 0, "5" : 0, "6" : 0]
        smokingVals.forEach { (item) in
            let intervalDays = getDayIntervalsFromToday(comepareWith: item.smokingTime)
            if(intervalDays < 7) {
                weekDic[intervalDays.description] = (weekDic[intervalDays.description] ?? 0) + 1
            } else {
                return
            }
        }
        return weekDic
    }
    
    func setBottomLabels(){
        let weekDic = getWeekData()
        let thisWeekCount = (0..<7).map { (i) in
            let val = (weekDic[i.description] ?? 0)
            return val
            }.reduce(0) { $0+$1 }
        thisWeekCountLabel.text = thisWeekCount.description + " 개피"
        todayCountLabel.text = (weekDic["0"] ?? 0).description + " 개피"
        avgPerDayLabel.text = String(format: "%.1f", Double(thisWeekCount)/Double(7)) + " 개피"
    }
    
    func setChartDataCount() {
        let weekDic = getWeekData()
        
        let yVals = (0..<7).map { (i) -> BarChartDataEntry in
            let index = 6-i
            let val = Double(weekDic[index.description] ?? Int(000.1))
            return BarChartDataEntry(x: Double(i), y: (val))
        }
    
        let smokingChartDataSet = BarChartDataSet(entries: yVals, label: "Data Set")

    
        var colors = (0..<6).map { _ in
            NSUIColor(red: 163/255.0, green: 163/255.0, blue: 163/255.0, alpha: 1.0)
        }
       
        colors.append(NSUIColor(red: 0/255.0, green: 98/255.0, blue: 255/255.0, alpha: 1.0))
        smokingChartDataSet.colors = colors
        smokingChartDataSet.drawValuesEnabled = false
        let data = BarChartData(dataSet: smokingChartDataSet)
        chartView.data = data
        chartView.fitBars = true
        
        chartView.setNeedsDisplay()
    }
    
  
}
