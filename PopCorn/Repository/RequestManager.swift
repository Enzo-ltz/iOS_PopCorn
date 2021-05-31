//
//  File.swift
//  PopCorn
//
//  Created by Enzo on 18/05/2021.
//

import Foundation
import UIKit

struct RequestManager {
    static var shared = RequestManager()

    func requestData(url: URL, completion: @escaping (Data) -> Void) -> Void {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return
            }
            if let data = data {
                completion(data)
            }
        }.resume()
    }
}
