//
//  FeedbackListItemTableViewCell.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import Foundation
import UIKit



let FeedbackListItemTableViewCellID = "FeedbackListItemTableViewCell"
class FeedbackListItemTableViewCell: UITableViewCell, FeedbackTableViewCell {
	
	@IBOutlet weak var itemImage: UIImageView!
	@IBOutlet weak var title: UILabel!
	
	var field: FeedbackField?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func configureCell(with field: FeedbackField) {
		self.field = field
		
		title.text = field.name
		//TODO: Add Image
	}
	
}


