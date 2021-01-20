//
//  HomeVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 02/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    
       @IBOutlet weak var segmentHomeHeader: UISegmentedControl!
       @IBOutlet weak var contaierView: UIView!
       @IBOutlet weak var searchBar: UISearchBar!
    
    
    private lazy var allVC: AllVC = {
           let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           var viewController = storyboard.instantiateViewController(withIdentifier: "AllVC") as! AllVC
           self.addChild(viewController)
           return viewController }()
    
    static func viewController() -> HomeVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Viewer") as! HomeVC
    }
    
     override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.isNavigationBarHidden = true
        }
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.isNavigationBarHidden = false
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        searchBar.searchTextField.textColor = .black
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                case .right:
                    guard segmentHomeHeader.selectedSegmentIndex != segmentHomeHeader.numberOfSegments - 1 else { return }
                    segmentHomeHeader.selectedSegmentIndex += 1
                    let vc = getScreen(at: segmentHomeHeader.selectedSegmentIndex)
                    self.add(asChildViewController: vc)
                    print("Swiped right")
                case .left:
                    guard segmentHomeHeader.selectedSegmentIndex != 0 else { return }
                    segmentHomeHeader.selectedSegmentIndex -= 1
                    let vc = getScreen(at: segmentHomeHeader.selectedSegmentIndex)
                    self.add(asChildViewController: vc)
                    print("Swiped left")
                default:
                    break
            }
        }
    }
    
    private func getScreen(at segment: Int) -> UIViewController {
            switch segment {
                case 0:
                    return allVC
    //            case 1:
    //                return agriculture
    //            case 2:
    //                return food
    //            case 3:
    //                return beverages
                default:
                    return UIViewController()
            }
        }
    @IBAction func segmentAction(_ sender: UISegmentedControl){
        updateView()
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
     private func add(asChildViewController viewController: UIViewController) {
            addChild(viewController)
            contaierView.addSubview(viewController.view)
            viewController.view.frame = contaierView.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            viewController.didMove(toParent: self)
        }
        private func remove(asChildViewController viewController: UIViewController) {
            viewController.willMove(toParent: nil)
            viewController.view.removeFromSuperview()
            viewController.removeFromParent()
        }
        private func updateView() {
            if segmentHomeHeader.selectedSegmentIndex == 0 {
                UIView.animate(withDuration: 0.5, animations:{
                  //  self.remove(asChildViewController: self.agriculture)
                   // self.remove(asChildViewController: self.food)
                    //self.remove(asChildViewController: self.beverages)
                    self.add(asChildViewController: self.allVC)
                })
            }else if segmentHomeHeader.selectedSegmentIndex == 1{
                UIView.animate(withDuration: 0.5, animations:{
                   // self.remove(asChildViewController: self.food)
                    self.remove(asChildViewController: self.allVC)
                  //  self.remove(asChildViewController: self.beverages)
                 //   self.add(asChildViewController: self.agriculture)
                })
            }else if segmentHomeHeader.selectedSegmentIndex == 2{
                UIView.animate(withDuration: 0.5, animations:{
                 //   self.remove(asChildViewController: self.agriculture)
                    self.remove(asChildViewController: self.allVC)
                 //   self.remove(asChildViewController: self.beverages)
                  //  self.add(asChildViewController: self.food)
                    
                })
            }else{
                UIView.animate(withDuration: 0.5, animations:{
                  //  self.remove(asChildViewController: self.agriculture)
                    self.remove(asChildViewController: self.allVC)
    //                self.remove(asChildViewController: self.food)
    //                self.add(asChildViewController: self.beverages)

                })
            }
        }
        func setupView() {
            updateView()
        }
        
}
