//
//  LocationsCell.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class LocationsCell: UITableViewCell {
    
    var avatarHolder : AvatarHolder!
    lazy var lblUpperData : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15,weight: .regular)
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var lblLowerData : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        lbl.textColor = .lightGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private var avHeightC : NSLayoutConstraint!
    var type : BankType.RawValue? {
        didSet {
            avatarHolder.setTypeData(type ?? 0)
        }
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    private func initView() {
        avatarHolder = AvatarHolder()
        avatarHolder.translatesAutoresizingMaskIntoConstraints = false
        addSubview(avatarHolder)
        avatarHolder.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        avatarHolder.heightAnchor.constraint(equalToConstant : 40).isActive = true
        avatarHolder.widthAnchor.constraint(equalToConstant : 40).isActive = true
        avatarHolder.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true

        avatarHolder.layer.cornerRadius = 20
        
        addSubview(lblUpperData)
        lblUpperData.leftAnchor.constraint(equalTo: avatarHolder.rightAnchor,constant: 20).isActive = true
        lblUpperData.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive = true
        lblUpperData.bottomAnchor.constraint(equalTo: avatarHolder.centerYAnchor).isActive = true
        lblUpperData.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true

        addSubview(lblLowerData)
        lblLowerData.leftAnchor.constraint(equalTo: avatarHolder.rightAnchor,constant: 20).isActive = true
        lblLowerData.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive = true
        lblLowerData.topAnchor.constraint(equalTo: avatarHolder.centerYAnchor).isActive = true
        lblLowerData.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20).isActive = true

    }

}
