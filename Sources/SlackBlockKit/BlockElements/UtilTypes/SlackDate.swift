import Foundation

/// A representation of a date that can be used with a Slack `DatePickerElement`.
public struct SlackDate: Codable, Equatable {
    public let year: UInt
    public let month: UInt
    public let day: UInt
    
    public init(year: UInt, month: UInt, day: UInt) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        let dateComponents = dateString.split(separator: "-")
        guard dateComponents.count == 3 else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid date structure: date not split into 3 components by `-` separator."
            )
        }
        guard let year = UInt(dateComponents[0]) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid date structure: year component not valid Int."
            )
        }
        guard let month = UInt(dateComponents[1]) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid date structure: month component not valid Int."
            )
        }
        guard let day = UInt(dateComponents[2]) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid date structure: day component not valid Int."
            )
        }
        self.year = year
        self.month = month
        self.day = day
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(String(format: "%04u-%02u-%02u", year, month, day))
    }
}
