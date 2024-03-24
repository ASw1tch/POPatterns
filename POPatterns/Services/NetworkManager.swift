//
//  NetworkManager.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 24.3.24..
//

import Foundation

class NetworkManager {
    static func fetchPatterns(completion: @escaping ([PatternModel]?) -> Void) {
        guard let data = PatternJSON.data else {
            completion(nil)
            return
        }
        
        do {
            let patterns = try JSONDecoder().decode([PatternModel].self, from: data)
            completion(patterns)
        } catch {
            print("Error decoding patterns: \(error)")
            completion(nil)
        }
    }
}
