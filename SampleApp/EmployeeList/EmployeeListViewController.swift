//
//  EmployeeListViewController.swift
//  SampleApp
//
//  Created by Nupur Parekh on 26/05/22.
//

import UIKit

class EmployeeListViewController: UIViewController {
  
  @IBOutlet weak var employeeTable: UITableView!
  @IBOutlet weak var loader: UIActivityIndicatorView!
  var employeeList = [EmployeeData]()
  var employeeListViewModel: EmployeeListViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loader.startAnimating()
    employeeListViewModel?.employeeListDelegate = self
    employeeListViewModel?.getEmployeeListData()
  }
  
  func showDetails(item: EmployeeData) {
    if let employeeDetailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EmployeeDetails") as? EmployeeDetailsViewController {
      employeeDetailsVC.employee = item
      self.navigationController?.pushViewController(employeeDetailsVC, animated: true)
    }
  }
  
}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employeeList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "employeeTableCell", for: indexPath) as! EmployeeTableCell
    cell.lblIndex.text = String(employeeList[indexPath.row].id)
    cell.lblName.text = employeeList[indexPath.row].firstName + " " + employeeList[indexPath.row].lastName
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.showDetails(item: employeeList[indexPath.row])
  }
}

extension EmployeeListViewController: EmployeeListViewModelProtocol {
  func reloadForEmployeeList(_ list: [EmployeeData]) {
    DispatchQueue.main.async {
      self.employeeList = list
      self.loader.startAnimating()
      self.employeeTable.reloadData()
    }
  }
  
  func failedEmployeeList(_ message: String) {
    DispatchQueue.main.async {
      self.loader.startAnimating()
      let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {_ in
        DispatchQueue.main.async {
          self.navigationController?.popViewController(animated: true)
        }
      }))
      self.present(alert, animated: true, completion: nil)
    }
  }
}
