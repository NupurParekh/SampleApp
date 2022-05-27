//
//  ApiManager.swift
//  SampleApp
//
//  Created by Nupur Parekh on 26/05/22.
//

import Foundation

protocol ApiManagerProtocol: AnyObject {
  func successToGetEmployeeList(_ list: [EmployeeData])
  func failedToGetEmployeeList(_ message: String)
}

class ApiManager {
  
  static let sharedInstance = ApiManager()
  weak var apiManagerProtocol: ApiManagerProtocol?
  private init(){}
  
  func getEmployeeList() {
    let url = URL(string: "https://hub.dummyapis.com/employee?noofRecords=50&idStarts=1001")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try decoder.decode([EmployeeData].self, from: data)
          self.apiManagerProtocol?.successToGetEmployeeList(result)
        } catch {
          self.apiManagerProtocol?.failedToGetEmployeeList("Something went wrong")
        }
      } else {
        self.apiManagerProtocol?.failedToGetEmployeeList("Something went wrong")
      }
    }
    task.resume()
  }
}
