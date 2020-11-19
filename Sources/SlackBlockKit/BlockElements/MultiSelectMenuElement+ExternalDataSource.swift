public extension MultiSelectMenuElement {
    /// This menu will load its options from an external data source, allowing for
    /// a dynamic list of options.
    ///
    /// Each time a menu of this type is opened or the user starts typing in the
    /// typeahead field, we'll send a request to your specified URL. Your app should
    /// return an HTTP 200 OK response, along with an `application/json` post body with
    /// an object containing either an `options` array, or an `option_groups` array.
    ///
    /// Works with block types:
    ///   - `Section`
    ///   - `Input`
    struct ExternalDataSource: Codable {
        public static let type = BlockType.multiExternalSelect
        /// The type of element. In this case `type` is always `multi_external_select`.
        public let type: String
        /// A `plain_text` only text object that defines the placeholder text shown on
        /// the menu. Maximum length for the `text` in this field is 150 characters.
        public let placeholder: TextObject
        /// An identifier for the action triggered when a menu option is selected. You
        /// can use this when you receive an interaction payload to identify the source
        /// of the action. Should be unique among all other `action_id`s in the containing
        /// block. Maximum length for this field is 255 characters.
        public let actionId: String
        /// When the typeahead field is used, a request will be sent on every character
        /// change. If you prefer fewer requests or more fully ideated queries, use the
        /// `min_query_length` attribute to tell Slack the fewest number of typed characters
        /// required before dispatch. The default value is `3`.
        public let minQueryLength: Int?
        /// An array of option objects that exactly match one or more of the options within
        /// `options` or `option_groups`. These options will be selected when the menu
        /// initially loads.
        public let initialOptions: [OptionObject]?
        /// A confirm object that defines an optional confirmation dialog that appears
        /// before the multi-select choices are submitted.
        public let confirm: ConfirmationDialogObject?
        /// Specifies the maximum number of items that can be selected in the menu.
        /// Minimum number is `1`.
        public let maxSelectedItems: Int?
        
        public init(
            placeholder: TextObject,
            actionId: String,
            minQueryLength: Int? = 3,
            initialOptions: [OptionObject]? = nil,
            confirm: ConfirmationDialogObject? = nil,
            maxSelectedItems: Int? = 1
        ) {
            self.type = Self.type.rawValue
            self.placeholder = placeholder
            self.actionId = actionId
            self.minQueryLength = minQueryLength
            self.initialOptions = initialOptions
            self.confirm = confirm
            self.maxSelectedItems = maxSelectedItems
        }
        
        public enum CodingKeys: String, CodingKey {
            case type
            case placeholder
            case actionId = "action_id"
            case minQueryLength = "min_query_length"
            case initialOptions = "initial_options"
            case confirm
            case maxSelectedItems = "max_selected_items"
        }
    }
}
