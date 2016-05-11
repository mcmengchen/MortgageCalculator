//
//  FundCell.swift
//  FangdaiCalculate
//
//  Created by william on 16/5/11.
//  Copyright © 2016年 Roobo. All rights reserved.
//

import UIKit

enum cellType {
    case cellTypeInput
    case cellTypeSwich
    case cellTypeInfo
}

class FundCell: UITableViewCell {
    
    @IBOutlet weak var textLab: UILabel!
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var swi: UISegmentedControl!
    @IBOutlet weak var detailLab: UILabel!
    var type:cellType{
        get{
            return self.type
        }
        set{
            switch newValue {
            case .cellTypeInfo:
                self.detailLab.hidden = false
                self.swi.hidden = true
                self.textF.hidden = true
                break
            case .cellTypeInput:
                self.detailLab.hidden = true
                self.swi.hidden = true
                self.textF.hidden = false
                break
            case .cellTypeSwich:
                self.detailLab.hidden = true
                self.swi.hidden = false
                self.textF.hidden = true
                break
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
