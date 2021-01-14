import SlackBlockKit
import XCTest

private let selectUserNoSelection = """
{
  "selected_user" : null,
  "type" : "users_select"
}
"""

private let selectUserWithSelection = """
{
  "selected_user" : "U01ERACBV43",
  "type" : "users_select"
}
"""

class SelectMenuUserListStateValueTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        jsonDecoder = JSONDecoder()
    }
    
    func test_selectConversations_noSelection_encode() throws {
        let selectedUser = try jsonEncoder.encodeAsString(
            SelectMenuUserListStateValue(selectedUser: nil)
        )
        XCTAssertEqual(selectedUser, selectUserNoSelection)
    }
    
    func test_selectConversations_noSelection_decode() throws {
        let expectedSelectedUser = SelectMenuUserListStateValue(selectedUser: nil)
        let selectedUser = try jsonDecoder.decode(
            SelectMenuUserListStateValue.self,
            from: selectUserNoSelection
        )
        XCTAssertEqual(selectedUser, expectedSelectedUser)
    }
    
    func test_selectConversations_withSelection_encode() throws {
        let selectedUser = try jsonEncoder.encodeAsString(
            SelectMenuUserListStateValue(selectedUser: "U01ERACBV43")
        )
        XCTAssertEqual(selectedUser, selectUserWithSelection)
    }
    
    func test_selectConversations_withSelection_decode() throws {
        let expectedSelectedUser = SelectMenuUserListStateValue(selectedUser: "U01ERACBV43")
        let selectedUser = try jsonDecoder.decode(
            SelectMenuUserListStateValue.self,
            from: selectUserWithSelection
        )
        XCTAssertEqual(selectedUser, expectedSelectedUser)
    }
}
