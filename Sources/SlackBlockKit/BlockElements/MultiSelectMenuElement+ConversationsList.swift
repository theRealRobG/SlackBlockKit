public extension MultiSelectMenuElement {
    /// This multi-select menu will populate its options with a list of public
    /// and private channels, DMs, and MPIMs visible to the current user in the
    /// active workspace.
    ///
    /// Works with block types:
    ///   - `Section`
    ///   - `Input`
    struct ConversationsList: Codable {
        public static let type = "multi_conversations_select"
        /// The type of element. In this case `type` is always `multi_conversations_select`.
        public let type: String
        /// A `plain_text` only text object that defines the placeholder text shown on the
        /// menu. Maximum length for the `text` in this field is 150 characters.
        public let placeholder: TextObject
        /// An identifier for the action triggered when a menu option is selected. You can
        /// use this when you receive an interaction payload to identify the source of the
        /// action. Should be unique among all other `action_id`s in the containing block.
        /// Maximum length for this field is 255 characters.
        public let actionId: String
        /// An array of one or more IDs of any valid conversations to be pre-selected when
        /// the menu loads. If `default_to_current_conversation` is also supplied,
        /// `initial_conversations` will be ignored.
        public let initialConversations: [String]?
        /// Pre-populates the select menu with the conversation that the user was viewing
        /// when they opened the modal, if available. Default is `false`.
        public let defaultToCurrentConversation: Bool?
        /// A confirm object that defines an optional confirmation dialog that appears before
        /// the multi-select choices are submitted.
        public let confirm: ConfirmationDialogObject?
        /// Specifies the maximum number of items that can be selected in the menu. Minimum
        /// number is 1.
        public let maxSelectedItems: Int?
        /// A filter object that reduces the list of available conversations using the
        /// specified criteria.
        public let filter: ConversationListsFilterObject?
        
        public init(
            placeholder: TextObject,
            actionId: String,
            initialConversations: [String]? = nil,
            defaultToCurrentConversation: Bool? = false,
            confirm: ConfirmationDialogObject? = nil,
            maxSelectedItems: Int? = 1,
            filter: ConversationListsFilterObject? = nil
        ) {
            self.type = Self.type
            self.placeholder = placeholder
            self.actionId = actionId
            self.initialConversations = initialConversations
            self.defaultToCurrentConversation = defaultToCurrentConversation
            self.confirm = confirm
            self.maxSelectedItems = maxSelectedItems
            self.filter = filter
        }
        
        public enum CodingKeys: String, CodingKey {
            case type
            case placeholder
            case actionId = "action_id"
            case initialConversations = "initial_conversations"
            case defaultToCurrentConversation = "default_to_current_conversation"
            case confirm
            case maxSelectedItems = "max_selected_items"
            case filter
        }
    }
}
