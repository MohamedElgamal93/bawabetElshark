//
//  AllVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 02/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit

class AllVC: UIViewController {
    @IBOutlet weak var segmentHomeFooter:  UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scorllView: UIScrollView!
    @IBOutlet weak var silderContorall: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var arrImage = [ UIImage(named:"Agricultural"),
                     UIImage(named: "clothes"),
                     UIImage(named:"Medicine_and_Health__") ]
    
    var time = Timer()
    var counter = 0
    var productHome: Product?
    
    private lazy var allproductVC: AllProductsVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "AllProductsVC") as! AllProductsVC
        
        viewController.productHome = self.productHome
        self.addChild(viewController)
        return viewController }()
    
    
    private lazy var suppliesVC: SuppliersVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SuppliersVC") as! SuppliersVC
        
        viewController.productHome = self.productHome
        self.addChild(viewController)
        
        return viewController }()
    
    static func viewController() -> AllVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Viewer") as! AllVC
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
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        self.setupView()
        let scrollViewBounds = scorllView.bounds
        _ = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsets.zero
        scrollViewInsets.top = scrollViewBounds.size.height/2.0;
        scrollViewInsets.top -= contentView.bounds.size.height/2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height/2.0
        scrollViewInsets.bottom -= contentView.bounds.size.height/2.0;
        scrollViewInsets.bottom += 1
        
        scorllView.contentInset = scrollViewInsets
        pageView.numberOfPages = arrImage.count
        pageView.currentPage = 0
        silderContorall.delegate = self
        silderContorall.dataSource = self
        DispatchQueue.main.async {
            self.time = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changImage), userInfo: nil, repeats: true)
            
        }
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                case .left:
                    segmentHomeFooter.selectedSegmentIndex = 0
                    self.add(asChildViewController: self.allproductVC)
                    print("Swiped right")
                case .right:
                    segmentHomeFooter.selectedSegmentIndex = 1
                    self.add(asChildViewController: self.suppliesVC)
                    print("Swiped left")
                default:
                    break
            }
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl){
        updateView()
    }
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    private func updateView() {
        if segmentHomeFooter.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations:{
                self.remove(asChildViewController: self.suppliesVC)
                self.add(asChildViewController: self.allproductVC)
            })
        }else {
            UIView.animate(withDuration: 0.5, animations:{
                self.remove(asChildViewController: self.allproductVC)
                self.add(asChildViewController: self.suppliesVC)
            })
        }
    }
    func setupView() {
        updateView()
    }
    @IBAction func goToAllCategory(_ sender: UIButton) {
        let allCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "AllCategoryVC") as! AllCategoryVC
        self.navigationController?.pushViewController(allCategoryVC, animated: true)
        
    }
    @IBAction func goToSupplier(_ sender: UIButton) {
        let supplierVC = self.storyboard?.instantiateViewController(withIdentifier: "SuppliersVC") as! SuppliersVC
        self.navigationController?.pushViewController(supplierVC, animated: true)
        
    }
    
    
    @objc func changImage() {
        if counter < arrImage.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.silderContorall.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            // print("scroll to \(index)")
            pageView.currentPage = counter
            counter += 1
        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.silderContorall.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
    }
    
}

extension AllVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = arrImage[indexPath.row]
        }else if let ab = cell.viewWithTag(222) as? UIPageControl {
            ab.currentPage = indexPath.row
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductSlideVC") as! ProductSlideVC
        if pageView.currentPage == 0  {
            productVC.slid = "32"
            productVC.nameCat = "Agricultural Crops"
            self.navigationController?.pushViewController(productVC, animated: true)
        }else if pageView.currentPage == 1 {
            productVC.slid = "38"
            productVC.nameCat = "Cothes"
            self.navigationController?.pushViewController(productVC, animated: true)
        }else{
            productVC.slid = "11"
            productVC.nameCat = "Medicine & Health"
            self.navigationController?.pushViewController(productVC, animated: true)
        }
        
    }
}
extension AllVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
}
