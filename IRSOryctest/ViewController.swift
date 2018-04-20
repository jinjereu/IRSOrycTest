//
//  ViewController.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	private var screenshot: UIImage?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		//TODO: Set up flags to only call this if we are enabling screenshot detection
		detectScreenshot()
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		NotificationCenter.default.removeObserver(self)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		
		//TODO: Set up flags to only call this if we are observing motion detection
		if motion == .motionShake {
			screenshot = captureScreenshot()
			presentFeedbackForm()
		}
		
	}
	
	@IBAction func triggerFeedbackFormBtnPressed(_ sender: Any) {
		screenshot = captureScreenshot()
		presentFeedbackForm()
	}
	
	
	
	private func detectScreenshot() {
		
		//Observe taking screenshot
		NotificationCenter.default.addObserver(forName: .UIApplicationUserDidTakeScreenshot,
											   object: nil,
											   queue: .main) { notification in
												
												self.screenshot = self.captureScreenshot()
												self.presentFeedbackForm()

		}
		
	}
	
	private func captureScreenshot() -> UIImage? {
		
		UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
		self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
		let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return image
		
	}
	
	private func presentFeedbackForm() {
		
		let navigationVC = UINavigationController()
		
		let feedbackFormVC = FeedbackFormViewController.init(nibName: FeedbackFormViewControllerID, bundle: Bundle.main)
		var feedback = Feedback()
		feedback.attachments = [FeedbackAttachment(name: "Screenshot", image: screenshot)]
		feedbackFormVC.feedback = feedback
		
		navigationVC.addChildViewController(feedbackFormVC)
		
		self.present(navigationVC, animated: true) {}
		
		
	}
	
	private func presentFeedbackConfirmation() {
		
		//TODO: Create this after creating Markup functionality. For now we are just going to send the screenshot directly to the Feedback form
		
	}
	
}

