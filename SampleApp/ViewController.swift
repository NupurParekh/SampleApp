//
//  ViewController.swift
//  SampleApp
//
//  Created by Nupur Parekh on 25/05/22.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func actionShowEmployeeData(_ sender: UIButton) {
    if let employeeListVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EmployeeList") as? EmployeeListViewController {
      let viewModel = EmployeeListViewModel()
      employeeListVC.employeeListViewModel = viewModel
      self.navigationController?.pushViewController(employeeListVC, animated: true)
    }
  }
  
}

