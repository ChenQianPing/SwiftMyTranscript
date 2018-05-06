//
//  PopTableViewCell.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/22.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit

class PopTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
