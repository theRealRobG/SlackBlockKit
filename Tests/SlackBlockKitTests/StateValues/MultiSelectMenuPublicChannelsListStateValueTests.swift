import SlackBlockKit
import XCTest

private let multiSelectMenuChannelsNoSelection = """
{
  "type": "multi_channels_select",
  "selected_channels": []
}
"""

private let multiSelectMenuChannelsSingleSelection = """
{
  "type": "multi_channels_select",
  "selected_channels": [
    "C01EN1PHXFX"
  ]
}
"""

private let multiSelectMenuChannelsMultiSelection = """
{
  "type": "multi_channels_select",
  "selected_channels": [
    "C01ERACCHA7",
    "C01EN1PHXFX"
  ]
}
"""

class MultiSelectMenuPublicChannelsListStateValueTests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_multiSelectMenuChannels_noSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuPublicChannelsListStateValue.self,
            from: multiSelectMenuChannelsNoSelection
        )
        let expectedState = MultiSelectMenuPublicChannelsListStateValue(selectedChannels: [])
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectMenuChannels_oneSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuPublicChannelsListStateValue.self,
            from: multiSelectMenuChannelsSingleSelection
        )
        let expectedState = MultiSelectMenuPublicChannelsListStateValue(
            selectedChannels: ["C01EN1PHXFX"]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
    
    func test_multiSelectMenuChannels_multiSelection() throws {
        let multiSelectState = try jsonDecoder.decode(
            MultiSelectMenuPublicChannelsListStateValue.self,
            from: multiSelectMenuChannelsMultiSelection
        )
        let expectedState = MultiSelectMenuPublicChannelsListStateValue(
            selectedChannels: ["C01ERACCHA7", "C01EN1PHXFX"]
        )
        XCTAssertEqual(multiSelectState, expectedState)
    }
}
