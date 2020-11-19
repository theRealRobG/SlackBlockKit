/// A multi-select menu allows a user to select multiple items from a list of options.
/// Just like regular select menus, multi-select menus also include type-ahead
/// functionality, where a user can type a part or all of an option string to filter
/// the list.
///
/// There are different types of multi-select menu that depend on different data
/// sources for their lists of options.
public enum MultiSelectMenuElement: Codable {
    /// Menu with conversations list
    case conversationsList(ConversationsList)
    /// Menu with external data source
    case externalDataSource(ExternalDataSource)
    /// Menu with channels list
    case publicChannelsList(PublicChannelsList)
    /// Menu with static options
    case staticOptions(StaticOptions)
    /// Menu with user list
    case userList(UserList)
    
    public init(from decoder: Decoder) throws {
        let type = try decoder
            .container(keyedBy: BlockTypeCodingKey.self)
            .decode(BlockType.self, forKey: .type)
        
        switch type {
        case ConversationsList.type:
            try self = .conversationsList(ConversationsList(from: decoder))
        case ExternalDataSource.type:
            try self = .externalDataSource(ExternalDataSource(from: decoder))
        case PublicChannelsList.type:
            try self = .publicChannelsList(PublicChannelsList(from: decoder))
        case StaticOptions.type:
            try self = .staticOptions(StaticOptions(from: decoder))
        case UserList.type:
            try self = .userList(UserList(from: decoder))
        default:
            throw UnexpectedBlockTypeDecodingError(
                unexpectedType: type,
                expectedTypes: [
                    .conversationsSelect,
                    .externalSelect,
                    .channelsSelect,
                    .staticSelect,
                    .usersSelect
                ]
            )
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .conversationsList(let element):
            try element.encode(to: encoder)
        case .externalDataSource(let element):
            try element.encode(to: encoder)
        case .publicChannelsList(let element):
            try element.encode(to: encoder)
        case .staticOptions(let element):
            try element.encode(to: encoder)
        case .userList(let element):
            try element.encode(to: encoder)
        }
    }
}
