import SlackBlockKit
import XCTest

private let selectChannelsNoSelection = """
{
  "selected_channel" : null,
  "type" : "channels_select"
}
"""

private let selectChannelsWithSelection = """
{
  "selected_channel" : "C01EN1PHXFX",
  "type" : "channels_select"
}
"""

private let selectChannelsWithUrlEnabled = """
{
  "response_url_enabled" : true,
  "selected_channel" : "C01EN1PHXFX",
  "type" : "channels_select"
}
"""

class SelectMenuPublicChannelsListStateValueTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        jsonDecoder = JSONDecoder()
    }
    
    func test_selectConversations_noSelection_encode() throws {
        let selectedChannel = try jsonEncoder.encodeAsString(
            SelectMenuPublicChannelsListStateValue(selectedChannel: nil)
        )
        XCTAssertEqual(selectedChannel, selectChannelsNoSelection)
    }
    
    func test_selectConversations_noSelection_decode() throws {
        let expectedSelectedChannel = SelectMenuPublicChannelsListStateValue(selectedChannel: nil)
        let selectedChannel = try jsonDecoder.decode(
            SelectMenuPublicChannelsListStateValue.self,
            from: selectChannelsNoSelection
        )
        XCTAssertEqual(selectedChannel, expectedSelectedChannel)
    }
    
    func test_selectConversations_withSelection_encode() throws {
        let selectedChannel = try jsonEncoder.encodeAsString(
            SelectMenuPublicChannelsListStateValue(selectedChannel: "C01EN1PHXFX")
        )
        XCTAssertEqual(selectedChannel, selectChannelsWithSelection)
    }
    
    func test_selectConversations_withSelection_decode() throws {
        let expectedSelectedChannel = SelectMenuPublicChannelsListStateValue(selectedChannel: "C01EN1PHXFX")
        let selectedChannel = try jsonDecoder.decode(
            SelectMenuPublicChannelsListStateValue.self,
            from: selectChannelsWithSelection
        )
        XCTAssertEqual(selectedChannel, expectedSelectedChannel)
    }
    
    func test_selectConversations_withResponseUrl_encode() throws {
        let selectedChannel = try jsonEncoder.encodeAsString(
            SelectMenuPublicChannelsListStateValue(
                selectedChannel: "C01EN1PHXFX",
                responseUrlEnabled: true
            )
        )
        XCTAssertEqual(selectedChannel, selectChannelsWithUrlEnabled)
    }
    
    func test_selectConversations_withResponseUrl_decode() throws {
        let expectedSelectedChannel = SelectMenuPublicChannelsListStateValue(
            selectedChannel: "C01EN1PHXFX",
            responseUrlEnabled: true
        )
        let selectedChannel = try jsonDecoder.decode(
            SelectMenuPublicChannelsListStateValue.self,
            from: selectChannelsWithUrlEnabled
        )
        XCTAssertEqual(selectedChannel, expectedSelectedChannel)
    }
}
