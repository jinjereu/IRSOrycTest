//
//  File.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import Foundation
import UIKit

let FeedbackFormViewControllerID = "FeedbackFormViewController"

class FeedbackFormViewController: UIViewController {
	
	var feedback: Feedback!
	
	@IBOutlet weak var feedbackTableView: UITableView!
	
	private var feedbackForm: FeedbackForm?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureView()
		configureTableView()
		configureForm()
		
	}
	
	private func configureView() {
		title = "Send Feedback"
		
		let cancelButton = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(cancelFeedback))
		let sendFeedBackButton = UIBarButtonItem.init(title: "Submit", style: .plain, target: self, action: #selector(sendFeedback))
		
		navigationItem.leftBarButtonItem = cancelButton
		navigationItem.rightBarButtonItem = sendFeedBackButton
		
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
	}
	
	@objc
	private func cancelFeedback() {
		self.dismiss(animated: true, completion: nil)
	}
	
	@objc
	private func sendFeedback() {
		//TODO: Show Email, perform validations
	}
	
	private func configureTableView() {
		
		feedbackTableView.register(UINib.init(nibName: FeedbackTextTableViewCellID, bundle: Bundle.main),
								   forCellReuseIdentifier: FeedbackTextTableViewCellID)
		feedbackTableView.register(UINib.init(nibName: FeedbackListItemTableViewCellID, bundle: Bundle.main),
								   forCellReuseIdentifier: FeedbackListItemTableViewCellID)
		
		feedbackTableView.estimatedRowHeight = 44.0
	
	}
	
	//TODO: Might better be in UITableView ?
	private func configureForm() {
		
		feedbackForm = FeedbackForm(fields: [FeedbackField(name: "Attachments", instruction: "", type: .List),
												 FeedbackField(name: "What Happened?", instruction: "Provide a summary of your report", type: .TextInput),
												 FeedbackField(name: "Steps to Reproduce", instruction: "Provide the steps to reproduce the issue, if applicable", type: .TextInput),
												 FeedbackField(name: "Expected Results", instruction: "Describe what you expect to happen", type: .TextInput),
												 FeedbackField(name: "Actual Results", instruction: "Describe what actually happened", type: .TextInput)])
		feedbackTableView.reloadData()
	}
	
	
	
}

extension FeedbackFormViewController: UITableViewDelegate, UITableViewDataSource {
	
	//MARK: UITableViewDataSource
	func numberOfSections(in tableView: UITableView) -> Int {
		if let fieldCount = feedbackForm?.fields.count {
			return fieldCount
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if let feedbackField = feedbackForm?.fields[section] {
			
			//TODO: Improve mapping between your feedback attachments and the first field
			switch feedbackField.type {
			case .TextInput:
				return 1
			case .List:
				return (feedback.attachments?.count)!
			}
			
		}
		return 0
		
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let feedbackField = feedbackForm?.fields[section]
		return feedbackField?.name
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = UITableViewCell()
		
		if let feedbackField = feedbackForm?.fields[indexPath.section] {
			
			switch feedbackField.type {
			case .List:
				let cell = tableView.dequeueReusableCell(withIdentifier: FeedbackListItemTableViewCellID)
					as! FeedbackListItemTableViewCell
				
				cell.configureCell(with: feedbackField)
				
				return cell
			case .TextInput:
				let cell = tableView.dequeueReusableCell(withIdentifier: FeedbackTextTableViewCellID)
					as! FeedbackTextTableViewCell
				cell.configureCell(with: feedbackField)
				
				return cell
			}
		
		}
		
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 44.0
	}
	
	//MARK: UITableViewDelegate

	
}

