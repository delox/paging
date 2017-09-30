//
//  ViewController.swift
//  Pager
//
//  Created by Solorzano on 9/30/17.
//  Copyright © 2017 Solorzano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var nextButton: UIButton!
	
	let yellow = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "yellowVC")
	
	let blue = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "blueVC")
	
	let red = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "redVC")

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.configurePVC()
	}
	
	func configurePVC() {
		guard let pvc = self.pageViewController else {return}
		
		pvc.setViewControllers([yellow], direction: .forward, animated: false)
	}
	
	var pageViewController: UIPageViewController? {
		return childViewControllers.flatMap({ $0 as? UIPageViewController }).first
		// This works because `flatMap` removes nils
	
	
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func nextTriggered(_ sender: Any) {
		guard let pvc = self.pageViewController else {return}

		if self.pageViewController?.viewControllers?.first is yellowVC {
			pvc.setViewControllers([blue], direction: .forward, animated: true)
		} else if self.pageViewController?.viewControllers?.first is blueVC {
			self.nextButton.isHidden = true
			pvc.setViewControllers([red], direction: .forward, animated: true)
		}
	}
}

class redVC : UIViewController {
	
}

class blueVC : UIViewController {
	
}

class yellowVC : UIViewController {
	
}
