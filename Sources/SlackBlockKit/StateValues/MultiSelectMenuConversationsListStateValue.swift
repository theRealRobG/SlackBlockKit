public struct MultiSelectMenuConversationsListStateValue: StateValue, Equatable {
    public static let type: StateValueType = .multiConversationsSelect
    public let type: String
    public let selectedConversations: [String]
    
    public init(selectedConversations: [String]) {
        self.type = Self.type.rawValue
        self.selectedConversations = selectedConversations
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedConversations = "selected_conversations"
    }
}
