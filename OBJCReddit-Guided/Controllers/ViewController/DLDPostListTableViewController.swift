//
//  DLDPostListTableViewController.swift
//  OBJCReddit-Guided
//
//  Created by Deven Day on 9/30/20.
//

import UIKit

class DLDPostListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var postSearchBar: UISearchBar!
    
    //MARK: - Properties
    var posts: [DLDPost] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postSearchBar.autocapitalizationType = .none
        postSearchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? DLDPostTableViewCell else { return UITableViewCell() }
        
        let post = posts[indexPath.row]
        cell.post = post

        return cell
    }
}//END OF CLASS

extension DLDPostListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = postSearchBar.text, !searchTerm.isEmpty else {return}
        
        DLDPostController.shared().fetchPosts(withSearchTerm: searchTerm) { (posts, _) in
            self.posts = posts
        }
    }
}//END OF EXTENSION
