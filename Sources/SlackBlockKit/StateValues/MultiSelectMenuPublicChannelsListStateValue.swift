public struct MultiSelectMenuPublicChannelsListStateValue: StateValue, Equatable {
    public static let type: StateValueType = .multiChannelsSelect
    public let type: String
    public let selectedChannels: [String]
    
    public init(selectedChannels: [String]) {
        self.type = Self.type.rawValue
        self.selectedChannels = selectedChannels
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedChannels = "selected_channels"
    }
}
