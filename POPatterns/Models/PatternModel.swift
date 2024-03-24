//
//  PatternModel.swift
//  POPatterns
//
//  Created by Anatoliy Petrov on 20.3.24..
//

import Foundation

struct PatternModel: Identifiable, Decodable, Hashable {
    let id: Int
    let title: String
    let description: String
    let imageName: String
}



