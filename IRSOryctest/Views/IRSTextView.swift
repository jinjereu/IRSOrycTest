//
//  IRSTextView.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import Foundation
import UIKit

class IRSTextView: UITextView {
	
	fileprivate var isEmpty: Bool = true
	var placeholder: String?
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		delegate = self
		
		setTextViewMode()
	}
	
	fileprivate func isTextViewEmpty() -> Bool {
		return text.isEmpty || text == ""
	}
	
	fileprivate func setTextViewMode() {
		if isTextViewEmpty() {
			textColor = .lightGray
			text = placeholder
		} else {
			textColor = .black
		}
	}
}

extension IRSTextView: UITextViewDelegate {
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		setTextViewMode()
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		setTextViewMode()
	}
	
}
