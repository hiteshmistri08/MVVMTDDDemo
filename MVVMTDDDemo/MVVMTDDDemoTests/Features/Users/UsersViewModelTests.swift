//
//  UsersViewModelTests.swift
//  MVVMTDDDemoTests
//
//  Created by Hitesh Chotaliya on 30/10/26.
//

import XCTest
@testable import MVVMTDDDemo

final class UsersViewModelTests: XCTestCase {
    func test_fetchUsers_whenRepositoryReturnsUsers_publishesUsers() async {
        //Given
        let expectedUsers = [
            User(id: 1, name: "John Doe", email: "john@example.com"),
            User(id: 2, name: "Jane Smith", email: "jane@example.com")
        ]
        
        let repository = MockUsersRepository(users: expectedUsers)
        let viewModel = UsersViewModel(repository: repository)
        
        // Verify inital state
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        
        //When
        await viewModel.fetchUsers()
        
        //Then
        XCTAssertEqual(viewModel.users, expectedUsers)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertTrue(repository.fetchUsersCalled)
    }
}
