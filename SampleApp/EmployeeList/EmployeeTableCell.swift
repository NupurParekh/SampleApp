//
//  EmployeeTableCell.swift
//  SampleApp
//
//  Created by Nupur Parekh on 26/05/22.
//

import UIKit

class EmployeeTableCell: UITableViewCell {

  @IBOutlet weak var lblIndex: UILabel!
  @IBOutlet weak var lblName: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
