/// A plain-text input, similar to the HTML `<input>` tag, creates a field
/// where a user can enter freeform data. It can appear as a single-line
/// field or a larger textarea using the `multiline` flag.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
///   - `Input`
public struct PlainTextInputElement: Codable {
    public static let type = BlockType.plainTextInput
    /// The type of element. In this case `type` is always `plain_text_input`.
    public let type: String
    /// An identifier for the input value when the parent modal is submitted.
    /// You can use this when you receive a `view_submission` payload to identify
    /// the value of the input element. Should be unique among all other
    /// `action_id`s in the containing block. Maximum length for this field is
    /// 255 characters.
    public let actionId: String
    /// A `plain_text` only text object that defines the placeholder text shown
    /// in the plain-text input. Maximum length for the `text` in this field is
    /// 150 characters.
    public let placeholder: TextObject?
    /// The initial value in the plain-text input when it is loaded.
    public let initialValue: String?
    /// Indicates whether the input will be a single line (`false`) or a larger
    /// textarea (`true`). Defaults to `false`.
    public let multiline: Bool?
    /// The minimum length of input that the user must provide. If the user
    /// provides less, they will receive an error. Maximum value is 3000.
    public let minLength: Int?
    /// The maximum length of input that the user can provide. If the user
    /// provides more, they will receive an error.
    public let maxLength: Int?
    /// A dispatch configuration object that determines when during text input
    /// the element returns a `block_actions` payload.
    public let dispatchActionConfig: DispatchActionConfiguration?
    
    public init(
        actionId: String,
        placeholder: TextObject? = nil,
        initialValue: String? = nil,
        multiline: Bool? = false,
        minLength: Int? = nil,
        maxLength: Int? = nil,
        dispatchActionConfig: DispatchActionConfiguration? = nil
    ) {
        self.type = Self.type.rawValue
        self.actionId = actionId
        self.placeholder = placeholder
        self.initialValue = initialValue
        self.multiline = multiline
        self.minLength = minLength
        self.maxLength = maxLength
        self.dispatchActionConfig = dispatchActionConfig
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case placeholder
        case initialValue = "initial_value"
        case multiline
        case minLength = "min_length"
        case maxLength = "max_length"
        case dispatchActionConfig = "dispatch_action_config"
    }
}
