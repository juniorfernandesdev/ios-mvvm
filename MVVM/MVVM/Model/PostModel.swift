//
//  PostModel.swift
//  MVVM
//
//  Created by Junior Fernandes on 23/01/21.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
