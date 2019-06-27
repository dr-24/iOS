//
//  ViewController.swift
//  Breather
//
//  Created by 강수진 on 27/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addSmokingInfo(_ sender: Any) {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    var smokingdata = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }
    
    func tableViewSetup(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return smokingdata.count+2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.cell(for: MainFirstTVCell.self)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.cell(for: MainSecondTVCell.self)
            return cell
        } else {
            let cell = tableView.cell(for: MainThirdTVCell.self)
            return cell
        }
    }
    
}

