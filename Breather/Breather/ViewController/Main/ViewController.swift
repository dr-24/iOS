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

class ViewController: UIViewController, TimeDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var smokingAccumulatedData : [SmokingData] = [] {
        didSet {
            tableView.reloadData()
            let cell = tableView.cell(for: MainFirstTVCell.self)
            cell.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        loadSmokingData()
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func loadSmokingData(){
        let realmSmokingData = LogManager.shared.getSmokingData().sorted(byKeyPath: "smokingTime", ascending: false).map{$0}
        smokingAccumulatedData = realmSmokingData.filter { (item) in
            return getDayIntervalsFromToday(comepareWith: item.smokingTime) < 7
        }
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

