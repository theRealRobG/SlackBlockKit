import SlackBlockKit
import XCTest

private let multiSelectMenuConversationsNoSelection = """
{
  "type": "multi_conversations_select",
  "selected_conversations": []
}
"""

private let multiSelectMenuConversationsSingleSelection = """
{
  "type": "multi_conversations_select",
  "selected_conversations": [
    "C01EN1PHXFX"
  ]
}
"""

private let multiSelectMenuConversationsMultiSelection = """
{
  "type": "multi_conversations_select",
  "selected_conversations": [
    "C01EN1PHXFX",
    "C01ERACCHA7",
    "U01ERACBV43"
  ]
}
"""

class MultiSelectMenuConversationsListStateValueTests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_multiSelectMenuConversations_noSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuConversationsListStateValue.self,
            from: multiSelectMenuConversationsNoSelection
        )
        let expectedState = MultiSelectMenuConversationsListStateValue(selectedConversations: [])
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectMenuConversations_oneSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuConversationsListStateValue.self,
            from: multiSelectMenuConversationsSingleSelection
        )
        let expectedState = MultiSelectMenuConversationsListStateValue(
            selectedConversations: ["C01EN1PHXFX"]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectMenuConversations_multiSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuConversationsListStateValue.self,
            from: multiSelectMenuConversationsMultiSelection
        )
        let expectedState = MultiSelectMenuConversationsListStateValue(
            selectedConversations: ["C01EN1PHXFX", "C01ERACCHA7", "U01ERACBV43"]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
}
