//
//  MenuViewController.swift
//  HamburgerMenu
//
//  Created by Brandon on 4/17/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var greenNavigationController: UIViewController!
    private var blueNavigationController: UIViewController!
    private var pinkNavigationController: UIViewController!
    
    var viewControllers: [UIViewController] = []
    var hamburgerViewController: HamburgerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        greenNavigationController = storyboard.instantiateViewController(withIdentifier: "GreenNavigationController")
        blueNavigationController = storyboard.instantiateViewController(withIdentifier: "BlueNavigationController")
        pinkNavigationController = storyboard.instantiateViewController(withIdentifier: "PinkNavigationController")
        
        viewControllers.append(greenNavigationController)
        viewControllers.append(blueNavigationController)
        viewControllers.append(pinkNavigationController)
        
        hamburgerViewController.contentViewController = greenNavigationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        let titles = ["Green","Blue","Pink"]
        cell.menuTitleLabel.text = titles[indexPath.row]
        
        return cell
    }
}
