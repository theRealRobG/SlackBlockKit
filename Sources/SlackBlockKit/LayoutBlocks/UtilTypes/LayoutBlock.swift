/// Blocks are a series of components that can be combined to create visually
/// rich and compellingly interactive messages.
public protocol LayoutBlock: Codable {
    static var type: LayoutBlockType { get }
    var type: String { get }
}

public func isEqual(lhs: LayoutBlock?, rhs: LayoutBlock?) -> Bool {
    guard let lhs = lhs, let rhs = rhs else { return false }
    
    switch Swift.type(of: lhs).type {
    case .actions:
        guard let lhs = lhs as? ActionsBlock, let rhs = rhs as? ActionsBlock else { return false }
        return lhs == rhs
    case .context:
        guard let lhs = lhs as? ContextBlock, let rhs = rhs as? ContextBlock else { return false }
        return lhs == rhs
    case .divider:
        guard let lhs = lhs as? DividerBlock, let rhs = rhs as? DividerBlock else { return false }
        return lhs == rhs
    case .file:
        guard let lhs = lhs as? FileBlock, let rhs = rhs as? FileBlock else { return false }
        return lhs == rhs
    case .header:
        guard let lhs = lhs as? HeaderBlock, let rhs = rhs as? HeaderBlock else { return false }
        return lhs == rhs
    case .image:
        guard let lhs = lhs as? ImageBlock, let rhs = rhs as? ImageBlock else { return false }
        return lhs == rhs
    case .input:
        guard let lhs = lhs as? InputBlock, let rhs = rhs as? InputBlock else { return false }
        return lhs == rhs
    case .section:
        guard let lhs = lhs as? SectionBlock, let rhs = rhs as? SectionBlock else { return false }
        return lhs == rhs
    }
}
