//
//  InnerDataVM.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/7/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class InnerDataVM: NSObject {
    
    weak var vc: InnerDataVC?
    var banName = String()
    var bank = BankObject()

    init(viewController: InnerDataVC) {
        self.vc = viewController
    }
    
    
}
extension InnerDataVM : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 : return 4
        case 1 : if bank.type == 0 {
            return 2
        } else {
            if bank.availability != nil {
                return 1
            } else {
                return 0
            }
            }
        default : return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InnerDataCell") as? InnerDataCell  {
            switch indexPath.section {
            case 0 :
                switch indexPath.row {
                case 0 : cell.lblTitle.text = GlobalConstants.Strings.TYPE
                cell.lblData.text = convertBankTypeToString(type: BankType.RawValue(bank.type))
                case 1 : cell.lblTitle.text = GlobalConstants.Strings.NAME
                cell.lblData.text = bank.name
                case 2 : cell.lblTitle.text = GlobalConstants.Strings.ADDRESS
                    cell.lblData.text = (bank.address)
                case 3 : cell.lblTitle.text = GlobalConstants.Strings.REGION
                    cell.lblData.text = bank.region
                default : break
                }
                
            case 1 :
                switch indexPath.row {
                case 0 : cell.lblTitle.text = GlobalConstants.Strings.AVAILABILITY
                    cell.lblData.text = (bank.availability ?? "")

                case 1 : cell.lblTitle.text = GlobalConstants.Strings.INFO
                    cell.lblData.text = "\(bank.noCash)"

                default : break
                }
            default : break
            }
//            cell.lblData.text = (banks[indexPath.row].address)
            return cell
        }
        return UITableViewCell()

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.hexStringToUIColor(hex: GlobalConstants.Colors.TableHeader)
        return v
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.hexStringToUIColor(hex: GlobalConstants.Colors.TableHeader)
        return v
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0 : return 0
        case 1 : return 50
        default : return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0 : return 0
        case 1 : return 50
        default : return 0
        }
    }
}
