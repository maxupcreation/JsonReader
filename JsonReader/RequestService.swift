
import Foundation

final class RequestService {
    
    var urlString = ""
    private let session: URLSession
    private var task: URLSessionDataTask?
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    /// Fetch data with result type which use Network error to get different description errors
    func fetchData(onCompletion: @escaping (Result<[Response], NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        task?.cancel()
        task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {

                onCompletion(.failure(.noData))
                print("Data was nil")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                onCompletion(.failure(.incorrectResponse))
                print("No response")
                return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode([Response].self, from: data) else {
                onCompletion(.failure(.undecodableData))
                print("Couldn't decode json")
                return
            }
            
            onCompletion(.success(decodedResponse))
        }
        task?.resume()
    }
}
