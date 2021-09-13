import Foundation

struct MovieNetworkModel: Codable {

    let response: [MovieClientModel]

    enum CodingKeys: String, CodingKey {
        case response = "results"
    }

}
