//
//  PXPaymentMethodComponentRenderer.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 24/11/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

class PXPaymentMethodComponentRenderer: NSObject {
    //Image
    let IMAGE_WIDTH: CGFloat = 48.0
    let IMAGE_HEIGHT: CGFloat = 48.0

    let TITLE_FONT_SIZE: CGFloat = 21.0
    let DETAIL_FONT_SIZE: CGFloat = 16.0
    let PM_DETAIL_FONT_SIZE: CGFloat = 14.0
    let DISCLAIMER_FONT_SIZE: CGFloat = 12.0


    func render(component: PXPaymentMethodComponent) -> PXPaymentMethodView {
        let pmBodyView = PXPaymentMethodView()
        pmBodyView.translatesAutoresizingMaskIntoConstraints = false
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        pmBodyView.paymentMethodIcon = icon
        icon.image = component.props.paymentMethodIcon
        pmBodyView.addSubview(icon)
        PXLayout.centerHorizontally(view: icon, to: pmBodyView).isActive = true
        PXLayout.setHeight(owner: icon, height: IMAGE_HEIGHT).isActive = true
        PXLayout.setWidth(owner: icon, width: IMAGE_WIDTH).isActive = true
        PXLayout.pinTop(view: icon, to:pmBodyView, withMargin: PXLayout.L_MARGIN).isActive = true

        // Title
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        pmBodyView.amountTitle = title
        pmBodyView.addSubview(title)
        title.text = component.props.amountTitle
        title.font = Utils.getFont(size: TITLE_FONT_SIZE)
        title.textColor = .pxBlack
        title.textAlignment = .center
        PXLayout.put(view: title, onBottomOfLastViewOf: pmBodyView, withMargin: PXLayout.S_MARGIN)?.isActive = true
        PXLayout.pinLeft(view: title, to: pmBodyView, withMargin: PXLayout.S_MARGIN).isActive = true
        PXLayout.pinRight(view: title, to: pmBodyView, withMargin: PXLayout.S_MARGIN).isActive = true

        if let detailText = component.props.amountDetail {
            let detailLabel = UILabel()
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            pmBodyView.addSubview(detailLabel)
            pmBodyView.amountDetail = detailLabel
            detailLabel.text = detailText
            detailLabel.font = Utils.getFont(size: DETAIL_FONT_SIZE)
            detailLabel.textColor = .pxBrownishGray
            detailLabel.textAlignment = .center
            PXLayout.setHeight(owner: detailLabel, height: 18.0).isActive = true
            PXLayout.put(view: detailLabel, onBottomOfLastViewOf: pmBodyView, withMargin: PXLayout.XXS_MARGIN)?.isActive = true
            PXLayout.pinLeft(view: detailLabel, to: pmBodyView, withMargin: PXLayout.XXS_MARGIN).isActive = true
            PXLayout.pinRight(view: detailLabel, to: pmBodyView, withMargin: PXLayout.XXS_MARGIN).isActive = true
        }

        if let paymentMethodDescription = component.props.paymentMethodDescription {
            let descriptionLabel = UILabel()
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            pmBodyView.addSubview(descriptionLabel)
            pmBodyView.paymentMethodDescription = descriptionLabel
            descriptionLabel.text = paymentMethodDescription
            descriptionLabel.font = Utils.getFont(size: DETAIL_FONT_SIZE)
            descriptionLabel.textColor = .pxBrownishGray
            descriptionLabel.textAlignment = .center
            PXLayout.put(view: descriptionLabel, onBottomOfLastViewOf: pmBodyView, withMargin: PXLayout.XS_MARGIN)?.isActive = true
            PXLayout.pinLeft(view: descriptionLabel, to: pmBodyView, withMargin: PXLayout.XS_MARGIN).isActive = true
            PXLayout.pinRight(view: descriptionLabel, to: pmBodyView, withMargin: PXLayout.XS_MARGIN).isActive = true
        }

        if let pmDetailText = component.props.paymentMethodDetail {
            let pmDetailLabel = UILabel()
            pmDetailLabel.translatesAutoresizingMaskIntoConstraints = false
            pmBodyView.paymentMethodDetail = pmDetailLabel
            pmBodyView.addSubview(pmDetailLabel)
            pmDetailLabel.text = pmDetailText
            pmDetailLabel.font = Utils.getFont(size: PM_DETAIL_FONT_SIZE)
            pmDetailLabel.textColor = .pxBrownishGray
            pmDetailLabel.textAlignment = .center
            PXLayout.put(view: pmDetailLabel, onBottomOfLastViewOf: pmBodyView, withMargin:  PXLayout.XXS_MARGIN)?.isActive = true
            PXLayout.pinLeft(view: pmDetailLabel, to: pmBodyView, withMargin:  PXLayout.XXS_MARGIN).isActive = true
            PXLayout.pinRight(view: pmDetailLabel, to: pmBodyView, withMargin:  PXLayout.XXS_MARGIN).isActive = true
        }

        if let disclaimer = component.props.disclaimer {
            let disclaimerLabel = UILabel()
            disclaimerLabel.translatesAutoresizingMaskIntoConstraints = false
            pmBodyView.disclaimerLabel = disclaimerLabel
            pmBodyView.addSubview(disclaimerLabel)
            disclaimerLabel.text = disclaimer
            disclaimerLabel.numberOfLines = 2
            disclaimerLabel.font = Utils.getFont(size: DISCLAIMER_FONT_SIZE)
            disclaimerLabel.textColor = .pxBrownishGray
            disclaimerLabel.textAlignment = .center
            PXLayout.put(view: disclaimerLabel, onBottomOfLastViewOf: pmBodyView, withMargin:  PXLayout.M_MARGIN)?.isActive = true
            PXLayout.pinLeft(view: disclaimerLabel, to: pmBodyView, withMargin:  PXLayout.XS_MARGIN).isActive = true
            PXLayout.pinRight(view: disclaimerLabel, to: pmBodyView, withMargin:  PXLayout.XS_MARGIN).isActive = true
        }
        
        
        PXLayout.pinLastSubviewToBottom(view: pmBodyView, withMargin: PXLayout.L_MARGIN)?.isActive = true


        return pmBodyView
    }
}

class PXPaymentMethodView: PXBodyView {
    var paymentMethodIcon: UIImageView?
    var amountTitle: UILabel?
    var amountDetail: UILabel?
    var paymentMethodDescription: UILabel?
    var paymentMethodDetail: UILabel?
    var disclaimerLabel: UILabel?
}
