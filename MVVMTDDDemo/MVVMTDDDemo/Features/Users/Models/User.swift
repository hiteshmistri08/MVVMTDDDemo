//
//  User.swift
//  MVVMTDDDemo
//
//  Created by Hitesh Chotaliya on 30/10/26.
//

import Foundation

struct User: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let email: String
}
