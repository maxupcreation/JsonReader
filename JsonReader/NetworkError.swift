import Foundation

/// Handle different errors
enum NetworkError: Error {
    case noData
    case incorrectResponse
    case undecodableData
    
    var description: String {
        switch self {
        case .noData:
            return "There is no data"
        case .incorrectResponse:
            return "There is no response"
        case .undecodableData:
            return "Data is undecodable"
        }
    }
}
