//
//  HW_3M_2L
//
//  Created by John Doe on 08/08/2022.
//

struct Prediction: Decodable {
    
    let name: String
    let age: Int
    let count: Int
    
}

struct Github: Decodable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
   

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
    
    }
}

