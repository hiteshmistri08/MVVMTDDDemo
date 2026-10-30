# Test Plan — User Directory

## FR-001: Fetch Users

| Test Case | Expected Result |
|---|---|
| Fetch users successfully | Users are published |
| Repository returns empty array | Users collection remains empty |
| Repository throws an error | Error state is published |
| Fetch operation starts | Loading becomes true |
| Fetch operation completes | Loading becomes false |
| Fetch operation executes | Repository is called exactly once |

## Testing Approach

- Framework: XCTest
- Pattern: Given / When / Then
- Mock dependencies: MockUsersRepository
- Test type: ViewModel unit tests

### Test Dependencies

| Dependency | Implementation | Purpose |
|---|---|---|
| User | User.swift | Represents user data |
| UsersRepository | Protocol | Defines the data-fetching contract |
| UsersRepository | MockUsersRepository.swift | Provides predefined users without network calls |

### Requirement-to-Test Mapping

| Requirement ID | Test Case | Status |
|---|---|---|
| FR-001 | test_fetchUsers_whenRepositoryReturnsUsers_publishesUsers | Passed |
| FR-002| test_fetchUsers_whenRepositoryReturnsEmptyUsers_keepsUsersEmpty| Pending |
| FR-003 |  test_fetchUsers_whenRepositoryFails_setsErrorMessage|  Pending|
| FR-004 | test_fetchUsers_whenRequestIsInProgress_setsLoadingTrue | Pending |

## Status

- [x] User model created
- [x] UsersRepository protocol created
- [x] MockUsersRepository created
- [ ] ViewModel unit test executed

