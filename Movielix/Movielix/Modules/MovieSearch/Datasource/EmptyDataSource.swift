//
//  EmptyDataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/12/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class EmptyDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EmptyCell = tableView.dequeueCell(for: indexPath)
        cell.configure()
        return cell
    }
}
