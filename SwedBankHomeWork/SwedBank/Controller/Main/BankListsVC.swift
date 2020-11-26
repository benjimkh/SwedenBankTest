//
//  ViewController.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import UIKit

class BankListsVC: ParentVC {

    var vm : BankListsVM!
    var refreshControl = UIRefreshControl()
    lazy var table : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(RegionsCell.self, forCellReuseIdentifier: "RegionsCell")
        table.backgroundColor = .white
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initCustomtNav(title : "Regions")
        vm = BankListsVM(viewController: self)
        initService()
        initView() // create All UI Elements
        
    }
    private func initService() { // call each api async in diffrent thread so we could fetch them at the same time
        vm.downloadHandler()
        
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

