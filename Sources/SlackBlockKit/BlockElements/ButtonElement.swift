/// An interactive component that inserts a button. The button can be a
/// trigger for anything from opening a simple link to starting a complex workflow.
///
/// Works with block types:
///   - `Section`
///   - `Actions`
public struct ButtonElement: BlockElement {
    public static let type = BlockElementType.button
    /// The type of element. In this case `type` is always `button`.
    public let type: String
    /// A text object that defines the button's text. Can only be of `type: plain_text`.
    /// Maximum length for the `text` in this field is 75 characters.
    public let text: TextObject
    /// An identifier for this action. You can use this when you receive an interaction
    /// payload to identify the source of the action. Should be unique among all other
    /// `action_ids` in the containing block. Maximum length for this field is 255 characters.
    public let actionId: String
    /// A URL to load in the user's browser when the button is clicked. Maximum length for
    /// this field is 3000 characters. If you're using `url`, you'll still receive an
    /// interaction payload and will need to send an acknowledgement response.
    public let url: String?
    /// The value to send along with the interaction payload. Maximum length for this
    /// field is 2000 characters.
    public let value: String?
    /// Decorates buttons with alternative visual color schemes. Use this option with restraint.
    ///
    /// `primary` gives buttons a green outline and text, ideal for affirmation or confirmation
    /// actions. `primary` should only be used for one button within a set.
    ///
    /// `danger` gives buttons a red outline and text, and should be used when the action is
    /// destructive. Use `danger` even more sparingly than `primary`.
    ///
    /// If you don't include this field, the default button style will be used.
    public let style: ButtonStyle?
    /// A confirm object that defines an optional confirmation dialog after the button is clicked.
    public let confirm: ConfirmationDialogObject?
    
    public init(
        text: TextObject,
        actionId: String,
        url: String? = nil,
        value: String? = nil,
        style: ButtonStyle? = nil,
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.type = Self.type.rawValue
        self.text = text
        self.actionId = actionId
        self.url = url
        self.value = value
        self.style = style
        self.confirm = confirm
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case text
        case actionId = "action_id"
        case url
        case value
        case style
        case confirm
    }
}
