//
//  BankDetailsVC.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class BankDetailsVC: ParentVC {
    var bankCountry = String()
    var banks = [BankObject]()
    var vm : BankDetailsVM!
    lazy var table : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(LocationsCell.self, forCellReuseIdentifier: "LocationsCell")
        table.backgroundColor = .white
        return table
    }()
    var pageTitle : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initCustomtNav(title : pageTitle,showRightButton: false)
        vm = BankDetailsVM(viewController: self)
        
        let sortedArray = ((((banks.filter({ $0.country == bankCountry }))).filter {$0.region == pageTitle}).unique {$0.address}).sorted {
        $0.type == $1.type ? $0.name ?? "" < $1.name ?? "" : $0.type < $1.type

        } // sort by type and then alphabetiaclly
        vm.banks = sortedArray
        vm.bankRegion = pageTitle
        self.title = pageTitle
        vm.bankCountry = bankCountry
        initView() // create All UI Elements
        
    }
    
    private func initView() {
        initTableView()// create TableView
    }
    private func initTableView() {
        view.addSubview(table)
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        table.dataSource = vm
        table.delegate = vm

        
    }
    

    

}

