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
    
    func test_fetchUsers_whenRepositoryReturnsEmptyUsers_keepsUsersEmpty() async {
        // Given
        let repository = MockUsersRepository(users: [])
        let viewModel = UsersViewModel(repository: repository)
        
        // Verify initial state
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        
        // When
        await viewModel.fetchUsers()
        
        // Then
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertTrue(repository.fetchUsersCalled)
    }
    
    func test_fetchUsers_whenRepositoryFails_setsErrorMessage() async {
        // Given
        let repository = MockUsersRepository(users: [], error: MockUsersRepository.MockError.failedToFetch)
        let viewModel = UsersViewModel(repository: repository)
        
        // When
        await viewModel.fetchUsers()
        
        // Then
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertTrue(repository.fetchUsersCalled)
    }
    
    func test_fetchUsers_whenRequestIsInProgress_setsLoadingTrue() async {

        // Given
        let repository = MockUsersRepository(
            users: [
                User(id: 1, name: "John Doe", email: "john@example.com")
            ],
            delayNanoseconds: 500_000_000
        )

        let viewModel = UsersViewModel(repository: repository)

        // When
        let fetchTask = Task {
            await viewModel.fetchUsers()
        }

        // Allow the fetch task to start.
        await Task.yield()

        // Then
        XCTAssertTrue(viewModel.isLoading)

        // Wait for completion.
        await fetchTask.value

        XCTAssertFalse(viewModel.isLoading)
    }

}
