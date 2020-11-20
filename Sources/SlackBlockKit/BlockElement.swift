public protocol BlockElement: Codable {
    static var type: BlockElementType { get }
    var type: String { get }
}
