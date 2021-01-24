//
//  PostViewModel.swift
//  MVVM
//
//  Created by Junior Fernandes on 24/01/21.
//

import Foundation


struct PostViewMode {
    let post: Post

    init(post: Post) {
        self.post = post
    }

    var id: String {
        return String(self.post.id)
    }

    var title: String {
        return self.id + self.post.title
    }

    var body: String {
        return self.post.body
    }

}
