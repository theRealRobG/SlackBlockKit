import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#image__example
private let imageExample = """
{
  "type": "image",
  "image_url": "http://placekitten.com/700/500",
  "alt_text": "Multiple cute kittens"
}
"""

class ImageElementTests: BlockTestCase {
    func test_imageExample() {
        let expectedImageElement = ImageElement(
            imageUrl: "http://placekitten.com/700/500",
            altText: "Multiple cute kittens"
        )
        testCodableEquality(block: expectedImageElement, jsonString: imageExample)
    }
}
