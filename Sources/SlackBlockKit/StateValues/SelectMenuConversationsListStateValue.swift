public struct SelectMenuConversationsListStateValue: StateValue, Equatable {
    public static let type: StateValueType = .conversationsSelect
    public let type: String
    public let selectedConversation: String?
    public let responseUrlEnabled: Bool?
    
    public init(selectedConversation: String?, responseUrlEnabled: Bool? = nil) {
        self.type = Self.type.rawValue
        self.selectedConversation = selectedConversation
        self.responseUrlEnabled = responseUrlEnabled
    }
    
    // The selectedConversation is always needed, so we override the synthesized encode method, to ensure
    // that even if selectedConversation is nil, that it will still be encoded into the final output.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        if let selectedConversation = selectedConversation {
            try container.encode(selectedConversation, forKey: .selectedConversation)
        } else {
            try container.encodeNil(forKey: .selectedConversation)
        }
        try container.encodeIfPresent(responseUrlEnabled, forKey: .responseUrlEnabled)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedConversation = "selected_conversation"
        case responseUrlEnabled = "response_url_enabled"
    }
}
