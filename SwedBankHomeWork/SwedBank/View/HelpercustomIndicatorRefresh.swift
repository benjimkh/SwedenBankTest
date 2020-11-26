//
//  CustomIndicator.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/7/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class HelpercustomIndicatorRefresh {
static let shared = HelpercustomIndicatorRefresh()

    func customActivityIndicatory(_ viewContainer: UIView, startAnimate:Bool? = true)  {
        DispatchQueue.main.async {
            let window = UIApplication.shared.keyWindow!
            let v = UIView(frame: window.bounds)
            v.tag = 9009
                window.addSubview(v);

            v.backgroundColor = UIColor.black.withAlphaComponent(0.5)

            let v2 = UIView()
            v2.backgroundColor = UIColor.lightGray
            v2.layer.cornerRadius = 20
            v2.translatesAutoresizingMaskIntoConstraints = false

            v.addSubview(v2)


            v2.heightAnchor.constraint(equalToConstant: 100).isActive = true
            v2.widthAnchor.constraint(equalToConstant: 100).isActive = true
            v2.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
            v2.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
            let lbl = UILabel()
            lbl.text = "Refreshing..."
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textColor = .white
            lbl.font = UIFont.systemFont(ofSize: 10,weight: .bold)
            lbl.textAlignment = .center
            v2.addSubview(lbl)

            lbl.topAnchor.constraint(equalTo: v2.topAnchor).isActive = true
            lbl.bottomAnchor.constraint(equalTo: v2.bottomAnchor).isActive = true
            lbl.leftAnchor.constraint(equalTo: v2.leftAnchor).isActive = true
            lbl.rightAnchor.constraint(equalTo: v2.rightAnchor).isActive = true

        }
        

    }
    func removeRefreshView() {
        DispatchQueue.main.async {

        for v in UIApplication.shared.keyWindow!.subviews {
            if v.tag == 9009 {
                v.removeFromSuperview()
            }
        }
        }
    }
}
