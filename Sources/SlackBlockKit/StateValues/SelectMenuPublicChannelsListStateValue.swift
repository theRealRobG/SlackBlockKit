public struct SelectMenuPublicChannelsListStateValue: StateValue, Equatable {
    public static let type: StateValueType = .channelsSelect
    public let type: String
    public let selectedChannel: String?
    public let responseUrlEnabled: Bool?
    
    public init(selectedChannel: String?, responseUrlEnabled: Bool?) {
        self.type = Self.type.rawValue
        self.selectedChannel = selectedChannel
        self.responseUrlEnabled = responseUrlEnabled
    }
    
    // The selectedChannel is always needed, so we override the synthesized encode method, to ensure
    // that even if selectedChannel is nil, that it will still be encoded into the final output.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        if let selectedChannel = selectedChannel {
            try container.encode(selectedChannel, forKey: .selectedChannel)
        } else {
            try container.encodeNil(forKey: .selectedChannel)
        }
        try container.encodeIfPresent(responseUrlEnabled, forKey: .responseUrlEnabled)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedChannel = "selected_channel"
        case responseUrlEnabled = "response_url_enabled"
    }
}
