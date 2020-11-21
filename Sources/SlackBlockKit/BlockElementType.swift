public enum BlockElementType: String, Codable {
    case button
    case checkboxes
    case datepicker
    case image
    case multiConversationsSelect = "multi_conversations_select"
    case multiExternalSelect = "multi_external_select"
    case multiChannelsSelect = "multi_channels_select"
    case multiStaticSelect = "multi_static_select"
    case multiUsersSelect = "multi_users_select"
    case overflow
    case plainTextInput = "plain_text_input"
    case radioButtons = "radio_buttons"
    case conversationsSelect = "conversations_select"
    case externalSelect = "external_select"
    case channelsSelect = "channels_select"
    case staticSelect = "static_select"
    case usersSelect = "users_select"
    case timepicker
    
    // TextObject is somewhat of an exception to the rule as it acts as both a
    // compositional object and also as block element in its own right when being
    // used within layout blocks. However, unlike all other block elements, it has
    // multiple possible types. Both possible types are included in this enum.
    case plainText = "plain_text"
    case mrkdwn
    
    var blockMetaType: BlockElement.Type {
        switch self {
        case .button: return ButtonElement.self
        case .checkboxes: return CheckboxGroups.self
        case .datepicker: return DatePickerElement.self
        case .image: return ImageElement.self
        case .multiConversationsSelect: return MultiSelectMenuConversationsList.self
        case .multiExternalSelect: return MultiSelectMenuExternalDataSource.self
        case .multiChannelsSelect: return MultiSelectMenuPublicChannelsList.self
        case .multiStaticSelect: return MultiSelectMenuStaticOptions.self
        case .multiUsersSelect: return MultiSelectMenuUserList.self
        case .overflow: return OverflowMenuElement.self
        case .plainTextInput: return PlainTextInputElement.self
        case .radioButtons: return RadioButtonGroupElement.self
        case .conversationsSelect: return SelectMenuConversationsList.self
        case .externalSelect: return SelectMenuExternalDataSource.self
        case .channelsSelect: return SelectMenuPublicChannelsList.self
        case .staticSelect: return SelectMenuStaticOptions.self
        case .usersSelect: return SelectMenuUserList.self
        case .timepicker: return TimePickerElement.self
        case .plainText, .mrkdwn: return TextObject.self
        }
    }
}
