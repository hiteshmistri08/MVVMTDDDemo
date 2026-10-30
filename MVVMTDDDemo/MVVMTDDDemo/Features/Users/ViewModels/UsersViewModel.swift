//
//  UsersViewModel.swift
//  MVVMTDDDemo
//
//  Created by Hitesh Chotaliya on 30/10/26.
//

import Foundation
import Combine

final class UsersViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    
    // MARK: - Dependecies
    let repository: UsersRepository
    
    // MARK: - Intialization
    init(repository: UsersRepository) {
        self.repository = repository
    }
    
    func fetchUsers() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            users = try await repository.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
