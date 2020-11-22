/// Block elements can be used inside of `section`, `context`, and `actions` layout
/// blocks. Inputs can only be used inside of `input` blocks.
public protocol BlockElement: Codable {
    static var type: BlockElementType { get }
    var type: String { get }
}

public func isEqual(lhs: BlockElement?, rhs: BlockElement?) -> Bool {
    switch lhs {
    case .none:
        switch rhs {
        case .none: return true
        case .some: return false
        }
    case .some:
        switch rhs {
        case .none: return false
        case .some: break
        }
    }
    guard let lhs = lhs, let rhs = rhs else { return false }
    
    switch Swift.type(of: lhs).type {
    case .button:
        guard let lhs = lhs as? ButtonElement, let rhs = rhs as? ButtonElement else { return false }
        return lhs == rhs
    case .checkboxes:
        guard let lhs = lhs as? CheckboxGroups, let rhs = rhs as? CheckboxGroups else { return false }
        return lhs == rhs
    case .datepicker:
        guard let lhs = lhs as? DatePickerElement, let rhs = rhs as? DatePickerElement else { return false }
        return lhs == rhs
    case .image:
        guard let lhs = lhs as? ImageElement, let rhs = rhs as? ImageElement else { return false }
        return lhs == rhs
    case .multiConversationsSelect:
        guard let lhs = lhs as? MultiSelectMenuConversationsList, let rhs = rhs as? MultiSelectMenuConversationsList else { return false }
        return lhs == rhs
    case .multiExternalSelect:
        guard let lhs = lhs as? MultiSelectMenuExternalDataSource, let rhs = rhs as? MultiSelectMenuExternalDataSource else { return false }
        return lhs == rhs
    case .multiChannelsSelect:
        guard let lhs = lhs as? MultiSelectMenuPublicChannelsList, let rhs = rhs as? MultiSelectMenuPublicChannelsList else { return false }
        return lhs == rhs
    case .multiStaticSelect:
        guard let lhs = lhs as? MultiSelectMenuStaticOptions, let rhs = rhs as? MultiSelectMenuStaticOptions else { return false }
        return lhs == rhs
    case .multiUsersSelect:
        guard let lhs = lhs as? MultiSelectMenuUserList, let rhs = rhs as? MultiSelectMenuUserList else { return false }
        return lhs == rhs
    case .overflow:
        guard let lhs = lhs as? OverflowMenuElement, let rhs = rhs as? OverflowMenuElement else { return false }
        return lhs == rhs
    case .plainTextInput:
        guard let lhs = lhs as? PlainTextInputElement, let rhs = rhs as? PlainTextInputElement else { return false }
        return lhs == rhs
    case .radioButtons:
        guard let lhs = lhs as? RadioButtonGroupElement, let rhs = rhs as? RadioButtonGroupElement else { return false }
        return lhs == rhs
    case .conversationsSelect:
        guard let lhs = lhs as? SelectMenuConversationsList, let rhs = rhs as? SelectMenuConversationsList else { return false }
        return lhs == rhs
    case .externalSelect:
        guard let lhs = lhs as? SelectMenuExternalDataSource, let rhs = rhs as? SelectMenuExternalDataSource else { return false }
        return lhs == rhs
    case .channelsSelect:
        guard let lhs = lhs as? SelectMenuPublicChannelsList, let rhs = rhs as? SelectMenuPublicChannelsList else { return false }
        return lhs == rhs
    case .staticSelect:
        guard let lhs = lhs as? SelectMenuStaticOptions, let rhs = rhs as? SelectMenuStaticOptions else { return false }
        return lhs == rhs
    case .usersSelect:
        guard let lhs = lhs as? SelectMenuUserList, let rhs = rhs as? SelectMenuUserList else { return false }
        return lhs == rhs
    case .timepicker:
        guard let lhs = lhs as? TimePickerElement, let rhs = rhs as? TimePickerElement else { return false }
        return lhs == rhs
    case .plainText:
        guard let lhs = lhs as? TextObject, let rhs = rhs as? TextObject else { return false }
        return lhs == rhs
    case .mrkdwn:
        guard let lhs = lhs as? TextObject, let rhs = rhs as? TextObject else { return false }
        return lhs == rhs
    }
}
