//
//  InnerDataVC.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//


import Foundation
import UIKit

class InnerDataVC: ParentVC {
    var bankCountry = String()
    var bank = BankObject()
    var vm : InnerDataVM!
    lazy var table : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)

        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(InnerDataCell.self, forCellReuseIdentifier: "InnerDataCell")
        table.backgroundColor = UIColor.hexStringToUIColor(hex: "e4e4e4")
        table.tableFooterView = UIView()

        return table
    }()
    var pageTitle : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initCustomtNav(title : pageTitle,showRightButton: false,backTitle: bank.region)
        vm = InnerDataVM(viewController: self)
        vm.bank = bank
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "e4e4e4")

        vm.banName = pageTitle
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

