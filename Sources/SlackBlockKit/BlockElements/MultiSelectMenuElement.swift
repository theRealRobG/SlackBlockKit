public enum MultiSelectMenuElement: Codable {
    case conversationsList(ConversationsList)
    case externalDataSource(ExternalDataSource)
    case publicChannelsList(PublicChannelsList)
    case staticOptions(StaticOptions)
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
