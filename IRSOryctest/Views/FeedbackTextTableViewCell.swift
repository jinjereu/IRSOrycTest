//
//  FeedbackTextTableViewCell.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import Foundation
import UIKit



let FeedbackTextTableViewCellID = "FeedbackTextTableViewCell"
class FeedbackTextTableViewCell: UITableViewCell, FeedbackTableViewCell {
	
	@IBOutlet weak var textView: IRSTextView!
	
	var field: FeedbackField?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func configureCell(with field: FeedbackField) {
		self.field = field
		
		textView.placeholder = field.instruction
	}
	
}
