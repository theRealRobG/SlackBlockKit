/// A select menu, just as with a standard HTML `<select>` tag, creates a drop
/// down menu with a list of options for a user to choose. The select menu also
/// includes type-ahead functionality, where a user can type a part or all of
/// an option string to filter the list.
///
/// There are different types of select menu that depend on different data sources
/// for their lists of options.
public enum SelectMenuElement: Codable {
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
            .decode(String.self, forKey: .type)
        
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
            throw UnknownBlockTypeDecodingError(unknownType: type)
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
