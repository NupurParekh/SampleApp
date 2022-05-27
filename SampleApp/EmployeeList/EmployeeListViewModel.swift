//
//  EmployeeListViewModel.swift
//  SampleApp
//
//  Created by Nupur Parekh on 26/05/22.
//

import Foundation

protocol EmployeeListViewModelProtocol: AnyObject {
  func reloadForEmployeeList(_ list: [EmployeeData])
  func failedEmployeeList(_ message: String)
}

class EmployeeListViewModel: NSObject {
  
  private lazy var apiManager: ApiManager = {
    let manager = ApiManager.sharedInstance
    manager.apiManagerProtocol = self
    return manager
  }()
  weak var employeeListDelegate: EmployeeListViewModelProtocol?
  
  func getEmployeeListData() {
    apiManager.getEmployeeList()
  }
  
}

extension EmployeeListViewModel: ApiManagerProtocol {
  func successToGetEmployeeList(_ list: [EmployeeData]) {
    employeeListDelegate?.reloadForEmployeeList(list)
  }
  
  func failedToGetEmployeeList(_ message: String) {
    employeeListDelegate?.failedEmployeeList(message)
  }
}
