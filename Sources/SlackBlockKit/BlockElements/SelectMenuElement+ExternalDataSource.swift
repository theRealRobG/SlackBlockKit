public extension SelectMenuElement {
    /// This select menu will load its options from an external data source, allowing
    /// for a dynamic list of options.
    ///
    /// Each time a select menu of this type is opened or the user starts typing in the
    /// typeahead field, we'll send a request to your specified URL. Your app should
    /// return an HTTP 200 OK response, along with an `application/json` post body with an
    /// object containing either an `options` array, or an `option_groups` array.
    ///
    /// Works with block types:
    ///   - `Section`
    ///   - `Actions`
    ///   - `Input`
    struct ExternalDataSource: Codable {
        public static let type = "external_select"
        /// The type of element. In this case `type` is always `external_select`.
        public let type: String
        /// A `plain_text` only text object that defines the placeholder text shown on
        /// the menu. Maximum length for the `text` in this field is 150 characters.
        public let placeholder: TextObject
        /// An identifier for the action triggered when a menu option is selected. You can
        /// use this when you receive an interaction payload to identify the source of the
        /// action. Should be unique among all other `action_id`s in the containing block.
        /// Maximum length for this field is 255 characters.
        public let actionId: String
        /// A single option that exactly matches one of the options within the `options` or
        /// `option_groups` loaded from the external data source. This option will be
        /// selected when the menu initially loads.
        public let initialOption: OptionObject?
        /// When the typeahead field is used, a request will be sent on every character
        /// change. If you prefer fewer requests or more fully ideated queries, use the
        /// `min_query_length` attribute to tell Slack the fewest number of typed
        /// characters required before dispatch. The default value is `3`.
        public let minQueryLength: Int?
        /// A confirm object that defines an optional confirmation dialog that appears after
        /// a menu item is selected.
        public let confirm: ConfirmationDialogObject?
        
        public init(
            placeholder: TextObject,
            actionId: String,
            initialOption: OptionObject? = nil,
            minQueryLength: Int? = 3,
            confirm: ConfirmationDialogObject? = nil
        ) {
            self.type = Self.type
            self.placeholder = placeholder
            self.actionId = actionId
            self.initialOption = initialOption
            self.minQueryLength = minQueryLength
            self.confirm = confirm
        }
        
        public enum CodingKeys: String, CodingKey {
            case type
            case placeholder
            case actionId = "action_id"
            case initialOption = "initial_option"
            case minQueryLength = "min_query_length"
            case confirm
        }
    }
}
