//
//  ContentViewTableViewCell.swift
//  FirstFrameworkTesting
//
//  Created by Bharat Shilavat on 23/03/24.
//

import UIKit
import AllInOneAnimatorView

class ContentViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentNameLabelk: UILabel!
    @IBOutlet weak var cView: UIView!
    
    let conView = ContentView()
    
    func configureCell(with contentTypes: [ContentViewType]) {
        self.layoutIfNeeded()
        for contentType in contentTypes {
            conView.setup(with: contentType)
        }
        
        cView.addSubview(conView)
        conView.frame = cView.bounds
    }
}
