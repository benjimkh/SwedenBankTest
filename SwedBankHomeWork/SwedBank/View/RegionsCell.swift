//
//  RegionsCell.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//



import UIKit

class RegionsCell: UITableViewCell {
    
    lazy var lblData : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15,weight: .regular)
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    private func initView() {
        addSubview(lblData)
        lblData.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lblData.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.9).isActive = true
        lblData.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.9).isActive = true
        lblData.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
    }
    func makeCell() {
        
    }
}
