//
//  PXComponentContainerViewController.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 11/8/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

class PXComponentContainerViewController: MercadoPagoUIViewController {

    let STATUS_BAR_HEIGHT: CGFloat = 20.0
    var scrollView: UIScrollView!
    var contentView = UIView()
    var heightComponent: NSLayoutConstraint!
    var lastViewConstraint: NSLayoutConstraint!

    init() {
        self.scrollView = UIScrollView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(contentView)
        PXLayout.pinTop(view: contentView, to: scrollView).isActive = true
        PXLayout.centerHorizontally(view: contentView, to: scrollView).isActive = true
        PXLayout.equalizeWidth(view: contentView, to: scrollView).isActive = true
        //  PXLayout.equalizeHeight(view: contentView, to: scrollView).isActive = true
        contentView.backgroundColor = .pxWhite
        super.init(nibName: nil, bundle: nil)
        self.view.addSubview(self.scrollView)
        PXLayout.pinLeft(view: scrollView, to: self.view).isActive = true
        PXLayout.pinRight(view: scrollView, to: self.view).isActive = true
        PXLayout.pinTop(view: scrollView, to: self.view, withMargin: STATUS_BAR_HEIGHT).isActive = true
        PXLayout.pinBottom(view: scrollView, to: self.view).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
