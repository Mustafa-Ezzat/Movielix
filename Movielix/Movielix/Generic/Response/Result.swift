//
//  Result.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation
enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
