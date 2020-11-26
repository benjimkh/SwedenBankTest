//
//  BankDetailsVM.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/7/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class BankDetailsVM: NSObject {
    
    weak var vc: BankDetailsVC?
    let networking = APIManager.shared
    let presisting = PresistanceManager.shared
    var bankCountry = String()
    var bankRegion = String()
    var banks = [BankObject]()

    init(viewController: BankDetailsVC) {
        self.vc = viewController
    }
    
    
}
extension BankDetailsVM : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LocationsCell") as? LocationsCell  {
            cell.accessoryType = .disclosureIndicator
            cell.type = BankType.RawValue(banks[indexPath.row].type)
            cell.selectionStyle = .none
            cell.lblUpperData.text = (banks[indexPath.row].name)
            cell.lblLowerData.text = (banks[indexPath.row].address)
            return cell
        }
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let innerVC = InnerDataVC()
        innerVC.bank = banks[indexPath.row]
        innerVC.pageTitle = banks[indexPath.row].name ?? ""
        self.vc?.navigationController?.pushViewController(innerVC, animated: true)
    }
}
