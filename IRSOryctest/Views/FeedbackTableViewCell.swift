//
//  FeedbackTableViewCell.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import UIKit



protocol FeedbackTableViewCell {
	
	var field: FeedbackField? {get set}
	
	func configureCell(with field: FeedbackField)
	
}
