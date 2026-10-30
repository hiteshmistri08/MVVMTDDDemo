# Feature Requirements — User Directory

## Feature Overview

**Feature Name:** User Directory

**Objective:** Build a User Directory feature that retrieves users from a remote API and displays them in the application.

## FR-001: Fetch Users

**Requirement:**

When the User Directory screen loads, the ViewModel should request users from the repository and publish the successfully retrieved users.

**Acceptance Criteria:**

1. The ViewModel should initially have an empty users collection.
2. The ViewModel should request users through the UsersRepository dependency.
3. The repository should return the requested users successfully.
4. The ViewModel should publish the retrieved users.
5. The loading state should become false after the request completes successfully.

**Related Test:**

`test_fetchUsers_whenRepositoryReturnsUsers_publishesUsers`

**Implementation Status:** Done

**TDD Status:** Green — Test written; production implementation pending.

## FR-002: Handle Empty User Results

**Requirement:**
When the repository returns an empty user collection, the ViewModel should publish an empty collection without reporting an error.

**Acceptance Criteria:**
1. Users collection should be empty.
2. Loading should become false.
3. Error message should remain nil.

**Implementation Status:** Done

---

## FR-003: Handle Repository Failure

**Requirement:**
When the repository fails to fetch users, the ViewModel should publish an appropriate error message.

**Acceptance Criteria:**
1. Users collection should remain empty when initially empty.
2. Error message should not be nil.
3. Loading should become false.
4. The application should not crash.

**Implementation Status:** In Progress

---

## FR-004: Manage Loading State

**Requirement:**
The ViewModel should indicate loading while the repository request is in progress.

**Acceptance Criteria:**
1. Loading should become true when fetching starts.
2. Loading should become false when fetching finishes.
3. Loading should become false when fetching fails.

**Implementation Status:** In Progress

