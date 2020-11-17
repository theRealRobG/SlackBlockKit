/// An object that defines a dialog that provides a confirmation step to any
/// interactive element. This dialog will ask the user to confirm their action
/// by offering a confirm and deny buttons.
public struct ConfirmationDialogObject: Codable {
    /// A `plain_text`-only text object that defines the dialog's title.
    /// Maximum length for this field is 100 characters.
    public let title: TextObject
    /// A text object that defines the explanatory text that appears in the
    /// confirm dialog. Maximum length for the `text` in this field is 300 characters.
    public let text: TextObject
    /// A `plain_text`-only text object to define the text of the button that
    /// confirms the action. Maximum length for the `text` in this field is 30 characters.
    public let confirm: TextObject
    /// A `plain_text`-only text object to define the text of the button that cancels
    /// the action. Maximum length for the `text` in this field is 30 characters.
    public let deny: TextObject
    /// Defines the color scheme applied to the `confirm` button. A value of `danger` will
    /// display the button with a red background on desktop, or red text on mobile. A value
    /// of `primary` will display the button with a green background on desktop, or blue text
    /// on mobile. If this field is not provided, the default value will be `primary`.
    public let style: ButtonStyle?
    
    public init(
        title: TextObject,
        text: TextObject,
        confirm: TextObject,
        deny: TextObject,
        style: ButtonStyle? = .primary
    ) {
        self.title = title
        self.text = text
        self.confirm = confirm
        self.deny = deny
        self.style = style
    }
}
