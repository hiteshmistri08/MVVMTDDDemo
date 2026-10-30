//
//  UsersRepository.swift.swift
//  MVVMTDDDemo
//
//  Created by Hitesh Chotaliya on 30/10/26.
//

import Foundation

protocol UsersRepository {
    func fetchUsers() async throws -> [User]
}
