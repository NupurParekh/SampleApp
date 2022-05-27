//
//  EmployeeDetailsViewController.swift
//  SampleApp
//
//  Created by Nupur Parekh on 26/05/22.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {
  
  var employee: EmployeeData?
  @IBOutlet weak var lblFirstName: UILabel!
  @IBOutlet weak var lblLastName: UILabel!
  @IBOutlet weak var lblContactNumber: UILabel!
  @IBOutlet weak var lblEmail: UILabel!
  @IBOutlet weak var lblDOB: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    lblFirstName.text = employee?.firstName
    lblLastName.text = employee?.lastName
    lblContactNumber.text = employee?.contactNumber
    lblEmail.text = employee?.email
    lblDOB.text = employee?.dob
  }
  
  @IBAction func actionBack(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
}
