import Foundation

struct BookResponse: Decodable {
    let data: [Book]
}

struct Book: Decodable {
    let attributes: BookAttribute
}

struct BookAttribute: Decodable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String?
    let summary: String?
    let wikipediaUrl: String?
    let chapters: [BookChapters]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case pages
        case releaseDate = "release_date"
        case dedication
        case summary
        case wikipediaUrl
        case chapters
    }
}

struct BookChapters: Decodable {
    let title: String
}
