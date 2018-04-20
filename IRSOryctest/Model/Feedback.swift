//
//  File.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import Foundation
import UIKit

struct FeedbackAttachment {
	
	var name: String?
	var image: UIImage?

}

struct Feedback {
	
	var title: String?
	var attachments: [FeedbackAttachment]?
	var summary: String?
	var steps: String?
	var expectedResults: String?
	var actualResults: String?
	
}

struct FeedbackForm {
	
	var fields:[FeedbackField]
	
}

enum FeedbackFieldType {
	case TextInput
	case List
}

struct FeedbackField {
	
	var name: String
	var instruction: String?
	var type: FeedbackFieldType
	
}
