public extension SelectMenuElement {
    /// This select menu will populate its options with a list of public and private
    /// channels, DMs, and MPIMs visible to the current user in the active workspace.
    ///
    /// Works with block types:
    ///   - `Section`
    ///   - `Actions`
    ///   - `Input`
    struct ConversationsList: Codable {
        public static let type = "conversations_select"
        /// The type of element. In this case `type` is always `conversations_select`.
        public let type: String
        /// A `plain_text` only text object that defines the placeholder text shown on
        /// the menu. Maximum length for the `text` in this field is 150 characters.
        public let placeholder: TextObject
        /// An identifier for the action triggered when a menu option is selected. You can
        /// use this when you receive an interaction payload to identify the source of the
        /// action. Should be unique among all other `action_id`s in the containing block.
        /// Maximum length for this field is 255 characters.
        public let actionId: String
        /// The ID of any valid conversation to be pre-selected when the menu loads. If
        /// `default_to_current_conversation` is also supplied, `initial_conversation` will
        /// take precedence.
        public let initialConversation: String?
        /// Pre-populates the select menu with the conversation that the user was viewing
        /// when they opened the modal, if available. Default is `false`.
        public let defaultToCurrentConversation: Bool?
        /// A confirm object that defines an optional confirmation dialog that appears after
        /// a menu item is selected.
        public let confirm: ConfirmationDialogObject?
        /// **This field only works with menus in input blocks in modals.**
        ///
        /// When set to `true`, the `view_submission` payload from the menu's parent view
        /// will contain a `response_url`. This `response_url` can be used for message
        /// responses. The target conversation for the message will be determined by the
        /// value of this select menu.
        public let responseUrlEnabled: Bool?
        /// A filter object that reduces the list of available conversations using the
        /// specified criteria.
        public let filter: ConversationListsFilterObject?
        
        public init(
            placeholder: TextObject,
            actionId: String,
            initialConversation: String? = nil,
            defaultToCurrentConversation: Bool? = false,
            confirm: ConfirmationDialogObject? = nil,
            responseUrlEnabled: Bool? = nil,
            filter: ConversationListsFilterObject? = nil
        ) {
            self.type = Self.type
            self.placeholder = placeholder
            self.actionId = actionId
            self.initialConversation = initialConversation
            self.defaultToCurrentConversation = defaultToCurrentConversation
            self.confirm = confirm
            self.responseUrlEnabled = responseUrlEnabled
            self.filter = filter
        }
        
        public enum CodingKeys: String, CodingKey {
            case type
            case placeholder
            case actionId = "action_id"
            case initialConversation = "initial_conversation"
            case defaultToCurrentConversation = "default_to_current_conversation"
            case confirm
            case responseUrlEnabled = "response_url_enabled"
            case filter
        }
    }
}
