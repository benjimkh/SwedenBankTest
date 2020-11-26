//
//  BankListVM.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit
import Dispatch

class BankListsVM: NSObject {
    
    weak var vc: BankListsVC?
    let networking = APIManager.shared
    let presisting = PresistanceManager.shared
    var banks = [BankObject]()
    let timer = DispatchSource.makeTimerSource()

    
    init(viewController: BankListsVC) {
        self.vc = viewController

    }
    func fetchCountriesBankData(url : String,index: Int) {
        networking.request(url) {[weak self] (result) in
            guard let sSelf = self else { return }
            switch result {
            case .success(let data) :
                for bnkmdl in data {
                    DispatchQueue.main.sync {
                        let bankObj = BankObject(context: sSelf.presisting.context)
                        bankObj.address = bnkmdl.address
                        bankObj.availability = bnkmdl.availability
                        bankObj.coinStation = bnkmdl.coinStation ?? false
                        bankObj.info = bnkmdl.info
                        bankObj.latitude = bnkmdl.latitude ?? 0
                        bankObj.longitude = bnkmdl.longitude ?? 0
                        bankObj.name = bnkmdl.name
                        bankObj.noCash = bnkmdl.noCash ?? false
                        bankObj.region = bnkmdl.region ?? "Unknown Region"
                        bankObj.type = bnkmdl.type ?? 0
                        switch index {
                        case 0 : bankObj.country = GlobalConstants.Strings.Estonia
                        case 1 : bankObj.country = GlobalConstants.Strings.Latvia
                        case 2 : bankObj.country = GlobalConstants.Strings.Lithuania
                        default : break
                        }
                        sSelf.banks.append(bankObj)
                    }
                }
                debugPrint("BBB ||| ***2*** ",sSelf.banks.count,index)
                sSelf.presisting.save()
                sSelf.banks = sSelf.banks.sorted(by: { ($0.region ?? "") < ($1.region ?? "") })
                DispatchQueue.main.async {
                    sSelf.vc?.table.reloadData()
                }

                
            case .failure(let error) : print(error)
            }
        }
        
    }
    func fetchFirstTimeData() {
        let myArray = presisting.fetchDataFromDB()
        if myArray.count > 0 {
            debugPrint("BBBB ||| **** HAS DATA **** ", myArray.count)
            banks = (myArray).sorted(by: { ($0.region ?? "") < ($1.region ?? "") })
            
            DispatchQueue.main.async { [weak self] in
                guard let sSelf = self else { return }
                sSelf.vc?.table.reloadData()
            }

        } else {
            presisting.deleteAllData()
            for (index, api) in APIManager.shared.ApiList.enumerated() {
                fetchCountriesBankData(url: api,index: index)
            }
        }
    }
    func deleteRecords() {
        presisting.deleteAllData()
        let myArray = presisting.fetchDataFromDB()
        debugPrint("BBBB ||| **** HAS DATA **** ", myArray.count)
    }
    func downloadHandler() {
        fetchFirstTimeData()
        timer.setEventHandler() { [weak self] in
            guard let sSelf = self else { return }
          debugPrint("BBBB ||| **** REFRESHING NOW **** ")
            sSelf.reDownloadData()
        }
        timer.schedule(deadline: .now() + .seconds(3600), repeating: .seconds(3600), leeway: .seconds(60))
        timer.activate()

        
    }
    func run1HoursTimer() {
        
        let currentDate = Date()
        let waitingDateTimeInterval:Int64 = UserDefaults.standard.value(forKey: "waiting_time") as? Int64 ?? 0
        let currentDateTimeInterval = currentDate.currentTimeMillis()
        let dateDiffrence = currentDateTimeInterval - waitingDateTimeInterval
        if dateDiffrence > 60*1000 {
            debugPrint("BBBB ||| **** REFRESHING NOW **** ")
            presisting.deleteAllData()
            for (index, api) in APIManager.shared.ApiList.enumerated() {
                fetchCountriesBankData(url: api,index: index)
            }
            UserDefaults.standard.setValue(currentDateTimeInterval, forKey: "waiting_time")
            UserDefaults.standard.synchronize()
        }
    }

    func reDownloadData() {
        DispatchQueue.main.async {
            HelpercustomIndicatorRefresh.shared.customActivityIndicatory((self.vc?.view)!)
        }

        deleteRecords()
        banks.removeAll()
        DispatchQueue.main.async {[weak self] in
            guard let sSelf = self else { return }
            sSelf.vc?.table.reloadData()
        }

        for (index, api) in APIManager.shared.ApiList.enumerated() {
            fetchCountriesBankData(url: api,index: index)
        }
        DispatchQueue.main.async {[weak self] in
            guard let sSelf = self else { return }

            sSelf.vc?.table.reloadData()
        }
        debugPrint("REDOWNLOADING")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            HelpercustomIndicatorRefresh.shared.removeRefreshView()
        }
    }
    
}
extension BankListsVM : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 : return ((banks.filter({ $0.country == GlobalConstants.Strings.Estonia })).unique{$0.region ?? ""}.count)
        case 1 : return ((banks.filter({ $0.country == GlobalConstants.Strings.Latvia })).unique{$0.region ?? ""}.count)
        case 2 : return ((banks.filter({ $0.country == GlobalConstants.Strings.Lithuania })).unique{$0.region ?? ""}.count)
        default : return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RegionsCell") as? RegionsCell  {
            switch indexPath.section {
            case 0 : cell.lblData.text = ((banks.filter({ $0.country == GlobalConstants.Strings.Estonia }))).unique{$0.region ?? ""}[indexPath.row].region
            case 1 : cell.lblData.text = ((banks.filter({ $0.country == GlobalConstants.Strings.Latvia }))).unique{$0.region ?? ""}[indexPath.row].region
            case 2 : cell.lblData.text = ((banks.filter({ $0.country == GlobalConstants.Strings.Lithuania }))).unique{$0.region ?? ""}[indexPath.row].region
            default : break
            }
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()

    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 : return GlobalConstants.Strings.Estonia
        case 1 : return GlobalConstants.Strings.Latvia
        case 2 : return GlobalConstants.Strings.Lithuania
        default : return ""
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = BankDetailsVC()
        
            switch indexPath.section {
            case 0 : detailVC.pageTitle = ((banks.filter({ $0.country == GlobalConstants.Strings.Estonia }))).unique{$0.region ?? ""}[indexPath.row].region ?? ""
            detailVC.bankCountry = GlobalConstants.Strings.Estonia
                
            case 1 : detailVC.pageTitle = ((banks.filter({ $0.country == GlobalConstants.Strings.Latvia }))).unique{$0.region ?? ""}[indexPath.row].region ?? ""
                detailVC.bankCountry = GlobalConstants.Strings.Latvia
                
            case 2 : detailVC.pageTitle = ((banks.filter({ $0.country == GlobalConstants.Strings.Lithuania }))).unique{$0.region ?? ""}[indexPath.row].region ?? ""
                detailVC.bankCountry = GlobalConstants.Strings.Lithuania
            default : break
            }
        detailVC.banks = banks
        self.vc?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
