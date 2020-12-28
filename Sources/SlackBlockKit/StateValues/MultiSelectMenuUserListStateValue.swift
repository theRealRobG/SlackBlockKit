public struct MultiSelectMenuUserListStateValue: StateValue {
    public static let type: StateValueType = .multiUsersSelect
    public let type: String
    public let selectedUsers: [String]
    
    public init(selectedUsers: [String]) {
        self.type = Self.type.rawValue
        self.selectedUsers = selectedUsers
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedUsers = "selected_users"
    }
}
