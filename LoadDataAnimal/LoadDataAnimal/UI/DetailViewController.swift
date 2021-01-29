//
//  DetailViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/19/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitleNameDetail: UILabel!
    @IBOutlet weak var imageDetailView: UIImageView!
    @IBOutlet weak var viewDetail: UIView!
    
    @IBOutlet weak var lblNameDetail: UILabel!
    @IBOutlet weak var lblWeighDetail: UILabel!
    @IBOutlet weak var lblSpeedDetail: UILabel!
    @IBOutlet weak var lblOldDetail: UILabel!
    @IBOutlet weak var lblFoodDetail: UILabel!
    
    var imageDetail = UIImage()
    var titleNameDetail = ""
    var backgroundColor = UIColor()
    var detailName = ""
    var detailWeigh = ""
    var detailSpeed = ""
    var detailOld = ""
    var detailFood = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        loadDataDetail()
    } 
    
    func setUpLayer() {
        lblTitleNameDetail.textColor = UIColor.white
        view.backgroundColor = UIColor.white
        viewDetail.layer.cornerRadius = 20
        viewDetail.backgroundColor = backgroundColor
        imageDetailView.layer.cornerRadius = imageDetailView.frame.size.height / 2
        imageDetailView.clipsToBounds = true
        imageDetailView.layer.borderWidth = 2
        imageDetailView.contentMode = .scaleAspectFill
        imageDetailView.layer.borderColor = backgroundColor.cgColor
    }
    
    func loadDataDetail() {
        
        lblTitleNameDetail.text = titleNameDetail
        lblTitleNameDetail.textColor = backgroundColor
        lblNameDetail.text = detailName
        lblWeighDetail.text = detailWeigh
        lblSpeedDetail.text = detailSpeed
        lblOldDetail.text = detailOld
        lblFoodDetail.text = detailFood
        
        imageDetailView.image = imageDetail
    }
}

