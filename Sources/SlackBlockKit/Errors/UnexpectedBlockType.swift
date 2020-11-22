public struct UnexpectedBlockType<T>: Error {
    public let expectedBlockType: T.Type
    public let actualBlockType: BlockElement.Type
    
    public var localizedDescription: String {
        "Unexpected block type. Expected: \(expectedBlockType.self). Actual: \(actualBlockType.self)"
    }
}
