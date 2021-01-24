//
//  Network.swift
//  MVVM
//
//  Created by Junior Fernandes on 24/01/21.
//

import Foundation


class Network {
    var url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    func getPost(completion: @escaping ([Post]?, Error?) -> Void) {
        let session = URLSession.shared

        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }

            let post: [Post] = try! JSONDecoder().decode([Post].self, from: data)
            completion(post, nil)
        }

        task.resume()
    }
}
