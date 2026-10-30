//
//  MockUsersRepository.swift
//  MVVMTDDDemo
//
//  Created by Hitesh Chotaliya on 30/10/26.
//

import Foundation
@testable import MVVMTDDDemo

final class MockUsersRepository: UsersRepository {
    enum MockError: Error {
        case failedToFetch
    }
    
    private let result: Result<[User], Error>
    private let delayNanoseconds: UInt64
    
    private(set) var fetchUsersCalled: Bool = false
    
    init(users: [User] = [], error: Error? = nil, delayNanoseconds: UInt64 = 0) {
        if let error {
            self.result = .failure(error)
        } else {
            self.result = .success(users)
        }
        
        self.delayNanoseconds = delayNanoseconds
    }
    
    func fetchUsers() async throws -> [User] {
        fetchUsersCalled = true
        
        if delayNanoseconds > 0 {
            try await Task.sleep(nanoseconds: delayNanoseconds)
        }
        
        return try result.get()
    }
}
