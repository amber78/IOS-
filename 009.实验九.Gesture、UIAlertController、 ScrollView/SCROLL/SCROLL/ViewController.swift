//
//  ViewController.swift
//  SCROLL
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 hdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var scorll: UIScrollView!
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = scorll.bounds.width
        let height = scorll.bounds.height
        
        //设置代理
        scorll.delegate = self
        
        for i in 1...4 {
            let image = UIImageView(image: UIImage(named: "\(i)"))
            image.contentMode = .scaleAspectFit
            image.frame = CGRect(x:CGFloat(i-1)*width,y:0,width:width,height:height)
            scorll.addSubview(image)
        }
        
        //按一页一页的方式滚动
        scorll.isPagingEnabled = true
        //隐藏水平滚动条
        scorll.showsHorizontalScrollIndicator = false
        //设置内容大小
        scorll.contentSize = CGSize(width: width*4, height: height)
        
        page.numberOfPages = 4
        page.currentPage = 0
        page.pageIndicatorTintColor = UIColor.brown
        page.currentPageIndicatorTintColor = UIColor.red
        
        
        scroll.contentSize = CGSize(width: width, height: height)
        
        //最大缩放比例
        scroll.maximumZoomScale = 10
        //最小缩放比例
        scroll.minimumZoomScale = 0.1
        
        scroll.delegate = self
        let image1 = UIImageView(image: UIImage(named: "3"))
        image1.contentMode = .scaleAspectFill
        image1.frame = CGRect(x:0,y:0,width:width,height:height)
        scroll.addSubview(image1)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scroll.subviews.first
    }

    @IBAction func pageclick(_ sender: UIPageControl) {
        let currentpage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentpage) * scorll.bounds.width, y: 0, width: scorll.bounds.width, height: scorll.bounds.height)
        scorll.scrollRectToVisible(rect, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scorll: UIScrollView) {
        let currentPage = Int(scorll.contentOffset.x/(scorll.bounds.width-20))
        page.currentPage = Int(currentPage)
    }
    
    
    
    
}

