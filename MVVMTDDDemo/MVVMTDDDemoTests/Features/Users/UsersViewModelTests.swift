//
//  UsersViewModelTests.swift
//  MVVMTDDDemoTests
//
//  Created by Hitesh Chotaliya on 30/10/26.
//

import XCTest
@testable import MVVMTDDDemo

final class UsersViewModelTests: XCTestCase {
    func test_fetchUsers_whenRepositoryReturnsUsers_publishesUsers() {
        //Given
        let expectedUsers = [
            User(id: 1, name: "John Doe", email: "john@example.com"),
            User(id: 2, name: "Jane Smith", email: "jane@example.com")
        ]
        
        let repository = MockUsersRepository(users: expectedUsers)
        let viewModel = UsersViewModel(repository: repository)
        
        //When
        await repository.fetchUsers()
        
        //Then
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users[0].name, "John Doe")
        XCTAssertEqual(viewModel.users[1].name, "Jane Smith")
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.fetchUsersCalled)
    }
}
