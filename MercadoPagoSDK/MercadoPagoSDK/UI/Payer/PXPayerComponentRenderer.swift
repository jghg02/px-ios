//
//  PXPayerComponentRenderer.swift
//  MercadoPagoSDK
//
//  Created by Marcelo Oscar José on 14/10/2018.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

class PXPayerComponentRenderer: NSObject {

    // Image
    let IMAGE_WIDTH: CGFloat = 48.0
    let IMAGE_HEIGHT: CGFloat = 48.0

    // Action Button
    let BUTTON_HEIGHT: CGFloat = 34.0

    let NAME_LABEL_SIZE: CGFloat = PXLayout.M_FONT
    let IDENTIFICATION_LABEL_SIZE: CGFloat = PXLayout.XS_FONT

    func render(component: PXPayerComponent) -> PXPayerView {
        let payerView = PXPayerView()
        payerView.backgroundColor = component.props.backgroundColor
        payerView.translatesAutoresizingMaskIntoConstraints = false

        let payerIcon = component.getPayerIconComponent()
        payerView.payerIcon = payerIcon.render()
        payerView.payerIcon!.layer.cornerRadius = IMAGE_WIDTH/2
        payerView.addSubview(payerView.payerIcon!)
        PXLayout.centerHorizontally(view: payerView.payerIcon!).isActive = true
        PXLayout.setHeight(owner: payerView.payerIcon!, height: IMAGE_HEIGHT).isActive = true
        PXLayout.setWidth(owner: payerView.payerIcon!, width: IMAGE_WIDTH).isActive = true
        PXLayout.pinTop(view: payerView.payerIcon!, withMargin: PXLayout.L_MARGIN).isActive = true

        // Full Name
        let fullName = UILabel()
        fullName.translatesAutoresizingMaskIntoConstraints = false
        payerView.fullNameLabel = fullName
        payerView.addSubview(fullName)
        fullName.font = Utils.getFont(size: NAME_LABEL_SIZE)
        fullName.attributedText = component.props.fulltName
        fullName.textColor = component.props.nameLabelColor
        fullName.textAlignment = .center
        fullName.numberOfLines = 0
        payerView.putOnBottomOfLastView(view: fullName, withMargin: PXLayout.S_MARGIN)?.isActive = true
        PXLayout.pinLeft(view: fullName, withMargin: PXLayout.S_MARGIN).isActive = true
        PXLayout.pinRight(view: fullName, withMargin: PXLayout.S_MARGIN).isActive = true

        // Identification
        let identification = UILabel()
        identification.translatesAutoresizingMaskIntoConstraints = false
        payerView.identificationLabel = identification
        payerView.addSubview(identification)
        identification.font = Utils.getFont(size: IDENTIFICATION_LABEL_SIZE)
        identification.attributedText = component.props.identityfication
        identification.textColor = component.props.identificationLabelColor
        identification.textAlignment = .center
        identification.numberOfLines = 0
        payerView.putOnBottomOfLastView(view: identification, withMargin: PXLayout.S_MARGIN)?.isActive = true
        PXLayout.pinLeft(view: identification, withMargin: PXLayout.S_MARGIN).isActive = true
        PXLayout.pinRight(view: identification, withMargin: PXLayout.S_MARGIN).isActive = true

        // Action
        let actionButton = PXSecondaryButton()
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.buttonTitle = component.props.action.label
        actionButton.add(for: .touchUpInside, component.props.action.action)
        payerView.actionButton = actionButton
        payerView.addSubview(actionButton)
        payerView.putOnBottomOfLastView(view: actionButton, withMargin: PXLayout.S_MARGIN)?.isActive = true
        PXLayout.pinLeft(view: actionButton, withMargin: PXLayout.XXS_MARGIN).isActive = true
        PXLayout.pinRight(view: actionButton, withMargin: PXLayout.XXS_MARGIN).isActive = true

        PXLayout.setHeight(owner: payerView, height: 250).isActive = true
        payerView.pinLastSubviewToBottom(withMargin: PXLayout.L_MARGIN)?.isActive = true

        return payerView
    }
}
