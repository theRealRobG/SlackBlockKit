import SlackBlockKit
import XCTest

private let selectConversationsNoSelection = """
{
  "selected_conversation" : null,
  "type" : "conversations_select"
}
"""

private let selectConversationsWithSelection = """
{
  "selected_conversation" : "U01ERACBV43",
  "type" : "conversations_select"
}
"""

private let selectConversationsWithUrlEnabled = """
{
  "response_url_enabled" : true,
  "selected_conversation" : "U01ERACBV43",
  "type" : "conversations_select"
}
"""

class SelectMenuConversationsListStateValueTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        jsonDecoder = JSONDecoder()
    }
    
    func test_selectConversations_noSelection_encode() throws {
        let selectedConvo = try jsonEncoder.encodeAsString(
            SelectMenuConversationsListStateValue(selectedConversation: nil)
        )
        XCTAssertEqual(selectedConvo, selectConversationsNoSelection)
    }
    
    func test_selectConversations_noSelection_decode() throws {
        let expectedSelectedConvo = SelectMenuConversationsListStateValue(selectedConversation: nil)
        let selectedConvo = try jsonDecoder.decode(
            SelectMenuConversationsListStateValue.self,
            from: selectConversationsNoSelection
        )
        XCTAssertEqual(selectedConvo, expectedSelectedConvo)
    }
    
    func test_selectConversations_withSelection_encode() throws {
        let selectedConvo = try jsonEncoder.encodeAsString(
            SelectMenuConversationsListStateValue(selectedConversation: "U01ERACBV43")
        )
        XCTAssertEqual(selectedConvo, selectConversationsWithSelection)
    }
    
    func test_selectConversations_withSelection_decode() throws {
        let expectedSelectedConvo = SelectMenuConversationsListStateValue(selectedConversation: "U01ERACBV43")
        let selectedConvo = try jsonDecoder.decode(
            SelectMenuConversationsListStateValue.self,
            from: selectConversationsWithSelection
        )
        XCTAssertEqual(selectedConvo, expectedSelectedConvo)
    }
    
    func test_selectConversations_withResponseUrl_encode() throws {
        let selectedConvo = try jsonEncoder.encodeAsString(
            SelectMenuConversationsListStateValue(
                selectedConversation: "U01ERACBV43",
                responseUrlEnabled: true
            )
        )
        XCTAssertEqual(selectedConvo, selectConversationsWithUrlEnabled)
    }
    
    func test_selectConversations_withResponseUrl_decode() throws {
        let expectedSelectedConvo = SelectMenuConversationsListStateValue(
            selectedConversation: "U01ERACBV43",
            responseUrlEnabled: true
        )
        let selectedConvo = try jsonDecoder.decode(
            SelectMenuConversationsListStateValue.self,
            from: selectConversationsWithUrlEnabled
        )
        XCTAssertEqual(selectedConvo, expectedSelectedConvo)
    }
}
