public extension MultiSelectMenuElement {
    /// This multi-select menu will populate its options with a list of public
    /// channels visible to the current user in the active workspace.
    ///
    /// Works with block types:
    ///   - `Section`
    ///   - `Input`
    struct PublicChannelsList: Codable {
        public static let type = BlockType.multiChannelsSelect
        /// The type of element. In this case `type` is always `multi_channels_select`.
        public let type: String
        /// A `plain_text` only text object that defines the placeholder text shown on
        /// the menu. Maximum length for the `text` in this field is 150 characters.
        public let placeholder: TextObject
        /// An identifier for the action triggered when a menu option is selected. You
        /// can use this when you receive an interaction payload to identify the source
        /// of the action. Should be unique among all other `action_id`s in the containing
        /// block. Maximum length for this field is 255 characters.
        public let actionId: String
        /// An array of one or more IDs of any valid public channel to be pre-selected when
        /// the menu loads.
        public let initialChannels: [String]?
        /// A confirm object that defines an optional confirmation dialog that appears
        /// before the multi-select choices are submitted.
        public let confirm: ConfirmationDialogObject?
        /// Specifies the maximum number of items that can be selected in the menu.
        /// Minimum number is 1.
        public let maxSelectedItems: Int?
        
        public init(
            placeholder: TextObject,
            actionId: String,
            initialChannels: [String]? = nil,
            confirm: ConfirmationDialogObject? = nil,
            maxSelectedItems: Int? = 1
        ) {
            self.type = Self.type.rawValue
            self.placeholder = placeholder
            self.actionId = actionId
            self.initialChannels = initialChannels
            self.confirm = confirm
            self.maxSelectedItems = maxSelectedItems
        }
        
        public enum CodingKeys: String, CodingKey {
            case type
            case placeholder
            case actionId = "action_id"
            case initialChannels = "initial_channels"
            case confirm
            case maxSelectedItems = "max_selected_items"
        }
    }
}
