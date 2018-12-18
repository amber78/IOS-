//
//  PersonCell.swift
//  eight
//
//  Created by 509 on 2018/11/20.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var other: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
