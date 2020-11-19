public struct UnexpectedBlockTypeDecodingError: Error {
    public let unexpectedType: BlockType
    public let expectedTypes: [BlockType]
    public var localizedDescription: String {
        "Value for `type` property in Block JSON was not recognised. " +
            "Unexpected type: \(unexpectedType.rawValue). " +
            "ExpectedTypes: \(expectedTypes.map { $0.rawValue }.joined(separator: ", "))"
    }
}
