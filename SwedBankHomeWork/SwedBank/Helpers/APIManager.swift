//
//  APIManager.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
class APIManager {
    private init() {}
    static let shared = APIManager()
    var ApiList : [String] = [
        "https://www.swedbank.ee/finder.json",
        "https://ib.swedbank.lv/finder.json",
        "https://ib.swedbank.lt/finder.json"
    ]
    func request(_ urlPath: String, completion : @escaping (Result<[BankModel],NSError>) -> Void) {
        if let url = URL(string: urlPath) {
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = ["Swedbank-Embedded": "iphone-app"]
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) {(data, response, error) in
                
                if let unwrapedError = error {
                    completion(.failure(unwrapedError as NSError))
                } else if let unwrapedData = data {
                    completion(.success(self.parseJsonData(data: unwrapedData)))
                }
            }
            task.resume()
        } else {
            debugPrint("COULD NOT CONVERT URLPATH TO URL")
        }
    }
    
    func parseJsonData(data: Data) -> [BankModel] {
        
        var Banks = [BankModel]()
        let decoder = JSONDecoder()
        do {
            let banksDataStore = try decoder.decode([BankModel].self, from: data)
            Banks = banksDataStore
        } catch {
            print(error)
        }
        
        return Banks
    }
    
}
