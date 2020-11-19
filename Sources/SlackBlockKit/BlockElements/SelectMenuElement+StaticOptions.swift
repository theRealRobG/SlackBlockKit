public extension SelectMenuElement {
    /// This is the simplest form of select menu, with a static list of options
    /// passed in when defining the element.
    ///
    /// Works with block types:
    ///   - `Section`
    ///   - `Actions`
    ///   - `Input`
    struct StaticOptions: Codable {
        public static let type = BlockType.staticSelect
        /// The type of element. In this case `type` is always `static_select`.
        public let type: String
        /// A `plain_text` only text object that defines the placeholder text shown on
        /// the menu. Maximum length for the `text` in this field is 150 characters.
        public let placeholder: TextObject
        /// An identifier for the action triggered when a menu option is selected. You can
        /// use this when you receive an interaction payload to identify the source of the
        /// action. Should be unique among all other `action_id`s in the containing block.
        /// Maximum length for this field is 255 characters.
        public let actionId: String
        /// An array of option objects. Maximum number of options is 100. If `option_groups`
        /// is specified, this field should not be.
        public let options: [OptionObject]
        /// An array of option group objects. Maximum number of option groups is 100. If
        /// `options` is specified, this field should not be.
        public let optionGroups: [OptionGroupObject]?
        /// A single option that exactly matches one of the options within options or
        /// `option_groups`. This option will be selected when the menu initially loads.
        public let initialOption: OptionObject?
        /// A confirm object that defines an optional confirmation dialog that appears after
        /// a menu item is selected.
        public let confirm: ConfirmationDialogObject?
        
        public init(
            placeholder: TextObject,
            actionId: String,
            options: [OptionObject],
            optionGroups: [OptionGroupObject]? = nil,
            initialOption: OptionObject? = nil,
            confirm: ConfirmationDialogObject? = nil
        ) {
            self.type = Self.type.rawValue
            self.placeholder = placeholder
            self.actionId = actionId
            self.options = options
            self.optionGroups = optionGroups
            self.initialOption = initialOption
            self.confirm = confirm
        }
        
        public enum CodingKeys: String, CodingKey {
            case type
            case placeholder
            case actionId = "action_id"
            case options
            case optionGroups = "option_groups"
            case initialOption = "initial_option"
            case confirm
        }
    }
}
