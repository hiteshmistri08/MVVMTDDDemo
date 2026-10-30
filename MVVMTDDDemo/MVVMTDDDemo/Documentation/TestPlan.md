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

## Status

Pending implementation and test execution.
