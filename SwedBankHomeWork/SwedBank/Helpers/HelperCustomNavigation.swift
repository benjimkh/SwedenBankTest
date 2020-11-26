//
//  IGHelperCustomNav.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/6/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//


import Foundation
import UIKit

class HelperCustomNavigation {
    static let shared = HelperCustomNavigation()
    
    
    
    func createTitle(title: String? = nil, font: UIFont = UIFont.systemFont(ofSize: 17.0, weight: .bold)) -> UIView {
        
        let viewTitle = UIView()
        viewTitle.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        let lblTitle = UILabel()
        lblTitle.text = title
        lblTitle.font = font
        lblTitle.textColor = .black
        viewTitle.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.topAnchor.constraint(equalTo: viewTitle.topAnchor, constant: 0).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: viewTitle.leadingAnchor, constant: 0).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: viewTitle.trailingAnchor, constant: 0).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 0).isActive = true
        
        
        return viewTitle
        
        
    }
    
    
    func createRightButton() -> UIBarButtonItem {
        UIApplication.topViewController()!.navigationItem.title = ""
                
        let btnRight: UIButton = UIButton()
        btnRight.setTitle("", for: .normal)
        btnRight.setTitleColor(.darkGray, for: .normal)
        btnRight.addTarget(self, action: #selector(self.onClickRefresh(sender:)), for: UIControl.Event.touchUpInside)
        btnRight.frame = CGRect(x: 0, y: 0, width: 33/2, height: 27/2)
        btnRight.titleLabel!.font = UIFont.fontIcon(ofSize: 25)
        btnRight.titleLabel!.textAlignment = .left
        let barButton = UIBarButtonItem(customView: btnRight)
        return barButton
        
    }
    
    @objc func  onClickRefresh(sender: UIButton!)  {
        if UIApplication.topViewController() is BankListsVC {
            (UIApplication.topViewController() as! BankListsVC).vm.reDownloadData()
        }
    }
}
