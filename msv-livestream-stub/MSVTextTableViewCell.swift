//
//  MSVTextTableViewCell.swift
//  msv-livestream-stub
//
//  Created by Serge Moskalenko on 21.06.17.
//  Copyright © 2017 Serge Moskalenko. All rights reserved.
//  http://https://github.com/sergemoskalenko 
//

import UIKit

class MSVTextTableViewCell: UITableViewCell {
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
