public protocol ActionsBlockElement: BlockElement {}

/// A block that is used to hold interactive elements.
///
/// Available in surfaces:
///   - `Modals`
///   - `Messages`
///   - `Home tabs`
public struct ActionsBlock: LayoutBlock, Equatable {
    public static let type = LayoutBlockType.actions
    /// The type of block. For an actions block, `type` is always `actions`.
    public let type: String
    /// An array of interactive element objects - buttons, select menus, overflow menus,
    /// or date pickers. There is a maximum of 5 elements in each action block.
    public let elements: [ActionsBlockElement]
    /// A string acting as a unique identifier for a block. If not specified, a `block_id`
    /// will be generated. You can use this `block_id` when you receive an interaction payload
    /// to identify the source of the action. Maximum length for this field is 255 characters.
    /// `block_id` should be unique for each message and each iteration of a message. If a
    /// message is updated, use a new `block_id`.
    public let blockId: String?
    
    public init(
        elements: [ActionsBlockElement],
        blockId: String? = nil
    ) {
        if elements.count > 5 {
            assertionFailure("There is a maximum of 5 elements in each action block.")
        }
        
        self.type = Self.type.rawValue
        self.elements = Array(elements.prefix(5))
        self.blockId = blockId
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.blockId = try container.decodeIfPresent(String.self, forKey: .blockId)
        self.elements = try container.decode([AnyBlockElement].self, forKey: .elements).map {
            guard let actionsBlockElement = $0.element as? ActionsBlockElement else {
                throw UnexpectedBlockType(
                    expectedBlockType: ActionsBlockElement.self,
                    actualBlockType: Swift.type(of: $0.element).self
                )
            }
            return actionsBlockElement
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(elements.map(AnyBlockElement.init), forKey: .elements)
        try container.encodeIfPresent(blockId, forKey: .blockId)
    }
    
    public static func == (lhs: ActionsBlock, rhs: ActionsBlock) -> Bool {
        guard lhs.elements.count == rhs.elements.count else { return false }
        for (index, element) in lhs.elements.enumerated() {
            guard isEqual(lhs: element, rhs: rhs.elements[index]) else { return false }
        }
        return lhs.type == rhs.type && lhs.blockId == rhs.blockId
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case elements
        case blockId = "block_id"
    }
}
