//
//  UserModel.swift
//  9
//
//  Created by Вадим Савосько on 09.11.2022.
//

import Foundation

enum userJobs: Int {
    case someFirstJob = 0
    case someSecondJob = 1
}

struct UserModel {
    var title : String
    var age : String
    var job : userJobs?
}
