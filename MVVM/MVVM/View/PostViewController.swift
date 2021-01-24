//
//  PostViewController.swift
//  MVVM
//
//  Created by Junior Fernandes on 24/01/21.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var controller: PostController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.controller.getPost()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        self.controller = PostController(tela: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.row()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.controller.cell(tableView: tableView, indexPath: indexPath)
    }
}
