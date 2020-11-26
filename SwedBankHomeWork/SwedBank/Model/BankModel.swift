//
//  BankModel.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation

struct BankModel : Decodable {
        let address : String?
        let availability : String?
        let coinStation : Bool?
        let info : String?
        let latitude : Float?
        let longitude : Float?
        let name : String?
        let noCash : Bool?
        let region : String?
        let type : Int32?

        enum CodingKeys: String, CodingKey {
                case address = "a"
                case availability = "av"
                case coinStation = "cs"
                case info = "i"
                case latitude = "lat"
                case longitude = "lon"
                case name = "n"
                case noCash = "ncash"
                case region = "r"
                case type = "t"
        }
    

}
