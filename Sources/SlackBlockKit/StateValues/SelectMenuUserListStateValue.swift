public struct SelectMenuUserListStateValue: StateValue {
    public static let type: StateValueType = .usersSelect
    public let type: String
    public let selectedUser: String?
    
    public init(selectedUser: String?) {
        self.type = Self.type.rawValue
        self.selectedUser = selectedUser
    }
    
    // The selectedUser is always needed, so we override the synthesized encode method, to ensure
    // that even if selectedUser is nil, that it will still be encoded into the final output.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        if let selectedUser = selectedUser {
            try container.encode(selectedUser, forKey: .selectedUser)
        } else {
            try container.encodeNil(forKey: .selectedUser)
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedUser = "selected_user"
    }
}
