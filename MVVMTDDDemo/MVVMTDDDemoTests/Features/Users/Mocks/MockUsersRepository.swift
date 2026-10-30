//
//  MockUsersRepository.swift
//  MVVMTDDDemo
//
//  Created by Hitesh Chotaliya on 30/10/26.
//

import Foundation
@testable import MVVMTDDDemo

final class MockUsersRepository: UsersRepository {
    private let users: [User]
    private(set) var fetchUsersCalled: Bool = false
    
    init(users: [User]) {
        self.users = users
    }
    
    func fetchUsers() async throws -> [User] {
        fetchUsersCalled = true
        return users
    }
}
