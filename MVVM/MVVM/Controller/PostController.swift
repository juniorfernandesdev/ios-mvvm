//
//  PostController.swift
//  MVVM
//
//  Created by Junior Fernandes on 24/01/21.
//

import Foundation
import UIKit

class PostController {
    var tela: PostViewController
    var postViewModel = [PostViewMode]()

    init(tela: PostViewController) {
        self.tela = tela
    }

    func getPost() {
        let netWork = Network()

        netWork.getPost { (post, error) in
            guard let post = post else {
                print(error)
                return
            }
            self.postViewModel = post.map({ (post) -> PostViewMode in
                let vm = PostViewMode(post: post)
                return vm
            })

            DispatchQueue.main.async {
                self.tela.tableView.reloadData()
            }
        }
    }

    func row() -> Int {
        return self.postViewModel.count
    }

    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.postViewModel[indexPath.row].title
        return cell ?? UITableViewCell()
    }
}
