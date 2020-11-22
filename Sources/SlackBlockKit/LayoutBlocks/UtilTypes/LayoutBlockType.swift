public enum LayoutBlockType: String, Codable {
    case actions
    case context
    case divider
    case file
    case header
    case image
    case input
    case section
    
    var blockMetaType: LayoutBlock.Type {
        switch self {
        case .actions: return ActionsBlock.self
        case .context: return ContextBlock.self
        case .divider: return DividerBlock.self
        case .file: return FileBlock.self
        case .header: return HeaderBlock.self
        case .image: return ImageBlock.self
        case .input: return InputBlock.self
        case .section: return SectionBlock.self
        }
    }
}
