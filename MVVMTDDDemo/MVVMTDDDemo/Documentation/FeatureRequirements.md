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

**Implementation Status:** In Progress

**TDD Status:** Red — Test written; production implementation pending.
