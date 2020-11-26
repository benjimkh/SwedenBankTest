//
//  InnerDataCell.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class InnerDataCell: UITableViewCell {
    
    lazy var lblData : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textAlignment = .left

        return lbl
    }()
    lazy var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 10,weight: .regular)
        lbl.textColor = .lightGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textAlignment = .right
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    private func initView() {
        addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5).isActive = true
        lblTitle.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
        lblTitle.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.3).isActive = true
        lblTitle.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        addSubview(lblData)
        lblData.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        lblData.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5).isActive = true
        lblData.leftAnchor.constraint(equalTo: lblTitle.rightAnchor,constant: 20).isActive = true
        lblData.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive = true
        lblData.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true

    }
    func makeCell() {
        
    }
}
