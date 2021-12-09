// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Request
struct Response: Codable {
    let libraryName, dateExported, snippetsCount: String
    let snippets: [Snippet]

    enum CodingKeys: String, CodingKey {
        case libraryName = "Library Name"
        case dateExported = "Date Exported"
        case snippetsCount = "Snippets Count"
        case snippets = "Snippets"
    }
}

// MARK: - Snippet
struct Snippet: Codable {
    let dateCreated, dateModified, folder, title: String
    let fragments: [Fragment]
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case dateCreated = "Date Created"
        case dateModified = "Date Modified"
        case folder = "Folder"
        case title = "Title"
        case fragments = "Fragments"
        case tags = "Tags"
    }
    
}

// MARK: - Fragment
struct Fragment: Codable {
    let content: String
    let dateModified, note: String
    let title: Title
    let language: Language
    let dateCreated: String

    enum CodingKeys: String, CodingKey {
        case content = "Content"
        case dateModified = "Date Modified"
        case note = "Note"
        case title = "Title"
        case language = "Language"
        case dateCreated = "Date Created"
    }
}

enum Language: String, Codable {
    case plainText = "Plain Text"
    case swift = "Swift"
}

enum Title: String, Codable {
    case fragment = "Fragment"
}
