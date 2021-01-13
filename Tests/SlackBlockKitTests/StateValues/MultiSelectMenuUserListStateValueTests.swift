import SlackBlockKit
import XCTest

private let multiSelectMenuUsersNoSelection = """
{
  "type": "multi_users_select",
  "selected_users": []
}
"""

private let multiSelectMenuUsersSingleSelection = """
{
  "type": "multi_users_select",
  "selected_users": [
    "U01ERACBV43"
  ]
}
"""

private let multiSelectMenuUsersMultiSelection = """
{
  "type": "multi_users_select",
  "selected_users": [
    "U01ERACBV43",
    "USLACKBOT"
  ]
}
"""

class MultiSelectMenuUserListStateValueTests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_multiSelectMenuUserList_noSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuUserListStateValue.self,
            from: multiSelectMenuUsersNoSelection
        )
        let expectedState = MultiSelectMenuUserListStateValue(selectedUsers: [])
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectMenuUserList_oneSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuUserListStateValue.self,
            from: multiSelectMenuUsersSingleSelection
        )
        let expectedState = MultiSelectMenuUserListStateValue(
            selectedUsers: ["U01ERACBV43"]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectMenuUserList_multiSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuUserListStateValue.self,
            from: multiSelectMenuUsersMultiSelection
        )
        let expectedState = MultiSelectMenuUserListStateValue(
            selectedUsers: ["U01ERACBV43", "USLACKBOT"]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
}
