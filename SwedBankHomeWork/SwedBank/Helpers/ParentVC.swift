//
//  MainVC.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/6/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class ParentVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func initCustomtNav(title: String? = nil,font : UIFont = UIFont.systemFont(ofSize: 17.0, weight: .bold),showRightButton : Bool = true,backTitle : String? = nil) {
        let titleView = HelperCustomNavigation.shared.createTitle(title: title,font : font)
        UIApplication.topViewController()!.navigationItem.titleView = titleView
        if showRightButton {
            let rightBtn = HelperCustomNavigation.shared.createRightButton()
            UIApplication.topViewController()!.navigationItem.rightBarButtonItem = rightBtn
        }
        
        let backButton = UIBarButtonItem()
        backButton.title = backTitle ?? "Regions"
        UIApplication.topViewController()!.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton


    }

}
