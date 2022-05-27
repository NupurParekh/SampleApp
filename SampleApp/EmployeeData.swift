//
//  EmployeeData.swift
//  SampleApp
//
//  Created by Nupur Parekh on 26/05/22.
//

import Foundation

struct EmployeeData : Decodable {
  let id: Int
  let imageUrl: String
  let firstName: String
  let lastName: String
  let email: String
  let contactNumber: String
  let age: Int
  let dob: String
  let salary: Int
  let address: String
}
