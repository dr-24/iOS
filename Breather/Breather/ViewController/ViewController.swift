//
//  ViewController.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {

    @IBAction func addSmokingInfo(_ sender: Any) {
        let smokingData = SmokingData()
        smokingData.smokingTime = Date().millisecondsSince1970
        smokingData.smokingDuration = Int.random(in: 1 ... 10)
        LogManager.shared.addData(data: smokingData)
    }
   
    @IBOutlet weak var tableView: UITableView!
    
 
    var smokingAccumulatedData : [SmokingData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        loadSmokingData()
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func loadSmokingData(){
        //todo : 1주일 데이터 필터
        let realmSmokingData = LogManager.shared.getSmokingData()
        smokingAccumulatedData = realmSmokingData.sorted(byKeyPath: "smokingTime", ascending: false).map{$0}
    }
    
    func tableViewSetup(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return smokingAccumulatedData.count+2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.cell(for: MainFirstTVCell.self)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.cell(for: MainSecondTVCell.self)
            cell.configure(timeStamp: Date().millisecondsSince1970)
            return cell
        } else {
            let cell = tableView.cell(for: MainThirdTVCell.self)
            cell.configure(data: smokingAccumulatedData[indexPath.row-2])
            return cell
        }
    }
}

