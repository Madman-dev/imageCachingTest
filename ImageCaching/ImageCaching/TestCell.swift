//
//  testCell.swift
//  ImageCaching
//
//  Created by Jack Lee on 2023/12/17.
//

import UIKit

class TestCell: UITableViewCell {
    
    static let identifier = "TestCell"
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TestCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
