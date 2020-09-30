//
//  DLDPostTableViewCell.swift
//  OBJCReddit-Guided
//
//  Created by Deven Day on 9/30/20.
//

import UIKit

class DLDPostTableViewCell: UITableViewCell {

//MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var upvoteCountLabel: UILabel!
    
    //MARK: - Properties
    var post: DLDPost? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Helpers
    func updateViews() {
        guard let post = post else {return}
        titleLabel.text = post.title
        commentCountLabel.text = "\(post.commentCount) 💬"
        upvoteCountLabel.text = "\(post.ups) ⬆️"
    }
}//END OF CLASS
