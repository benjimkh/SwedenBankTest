//
//  Globals.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
enum BankType : Int {
    case Branch = 0
    case ATM = 1
    case BNA = 2
}
func convertBankTypeToString(type : BankType.RawValue) -> String {
    var st = ""
    switch type {
    case 0 : st = "Branch"
    case 1 : st = "ATM"
    case 2 : st = "BNA"
    default : break
    }
    return st
}
