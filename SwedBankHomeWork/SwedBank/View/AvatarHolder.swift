//
//  AvatarHolder.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/6/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class AvatarHolder: UIView {

    private var initialLettersView: UIView?
    private var initialLettersLabel: UILabel?

    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    
    private func configure() {
        self.layer.masksToBounds = true
        
        self.initialLettersView = UIView()
        self.addSubview(self.initialLettersView!)
        self.initialLettersView?.translatesAutoresizingMaskIntoConstraints = false
        self.initialLettersView?.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
        self.initialLettersView?.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        self.initialLettersView?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.initialLettersView?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        self.initialLettersLabel = UILabel()
        self.addSubview(self.initialLettersLabel!)
        self.initialLettersLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.initialLettersLabel?.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
        self.initialLettersLabel?.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        self.initialLettersLabel?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        self.initialLettersLabel?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    

    
    func setTypeData(_ type: BankType.RawValue) {
        var color = UIColor()
        
        switch type {
            case 0 :
                color = UIColor.hexStringToUIColor(hex: GlobalConstants.Colors.BranchAvatarColor)
                self.initialLettersLabel!.text = GlobalConstants.Strings.BranchAbbrevation

            case 1 :
                color = UIColor.hexStringToUIColor(hex: GlobalConstants.Colors.ATMAvatarColor)
                self.initialLettersLabel!.text = GlobalConstants.Strings.ATMAbbrevation
            
            case 2 :
                color = UIColor.hexStringToUIColor(hex: GlobalConstants.Colors.BNAAvatarColor)
                self.initialLettersLabel!.text = GlobalConstants.Strings.BNAAbbrevatio

            default : break
        }
        self.initialLettersLabel?.textAlignment = .center
        self.initialLettersLabel?.textColor = .white
            self.initialLettersView?.backgroundColor = color
            self.initialLettersLabel!.font = UIFont.systemFont(ofSize: 17.0,weight: .bold)
        
    }
    
    
    
    
}
