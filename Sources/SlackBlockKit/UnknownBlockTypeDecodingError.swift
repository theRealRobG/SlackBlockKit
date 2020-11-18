public struct UnknownBlockTypeDecodingError: Error {
    public let unknownType: String
    public var localizedDescription: String {
        "Value for `type` property in Block JSON was not recognised: \(unknownType)"
    }
}
