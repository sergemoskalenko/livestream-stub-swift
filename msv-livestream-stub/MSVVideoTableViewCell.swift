//  Converted with Swiftify v1.0.6381 - https://objectivec2swift.com/
//
//  MSVVideoTableViewCell.swift
//  msv-livestream-stub
//
//  Created by Serge Moskalenko on 21.06.17.
//  Copyright © 2017 Serge Moskalenko. All rights reserved.
//

import UIKit

class MSVVideoTableViewCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet private(set) weak var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}