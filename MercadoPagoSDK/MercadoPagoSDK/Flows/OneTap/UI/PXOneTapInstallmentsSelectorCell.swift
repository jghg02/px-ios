//
//  PXOneTapInstallmentsSelectorCell.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 30/10/18.
//

import UIKit

final class PXOneTapInstallmentsSelectorCell: UITableViewCell {

    var data: PXOneTapInstallmentsSelectorData?

    func updateData(_ data: PXOneTapInstallmentsSelectorData) {
        self.data = data
        self.selectionStyle = .default
        let selectedView = UIView()
        selectedView.backgroundColor = #colorLiteral(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        self.selectedBackgroundView = selectedView

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.attributedText = data.title
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        PXLayout.pinLeft(view: titleLabel, withMargin: PXLayout.M_MARGIN).isActive = true
        PXLayout.centerVertically(view: titleLabel).isActive = true

        let valueLabelsContainer = PXComponentView()
        valueLabelsContainer.clipsToBounds = true

        let topValueLabel = UILabel()
        topValueLabel.translatesAutoresizingMaskIntoConstraints = false
        topValueLabel.numberOfLines = 1
        topValueLabel.attributedText = data.topValue
        topValueLabel.textAlignment = .right
        valueLabelsContainer.addSubviewToBottom(topValueLabel)
        PXLayout.pinLeft(view: topValueLabel, withMargin: PXLayout.ZERO_MARGIN).isActive = true
        PXLayout.pinRight(view: topValueLabel, withMargin: PXLayout.M_MARGIN).isActive = true

        let bottomValueLabel = UILabel()
        bottomValueLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomValueLabel.numberOfLines = 1
        bottomValueLabel.attributedText = data.bottomValue
        bottomValueLabel.textAlignment = .right
        valueLabelsContainer.addSubviewToBottom(bottomValueLabel)
        PXLayout.pinLeft(view: bottomValueLabel, withMargin: PXLayout.ZERO_MARGIN).isActive = true
        PXLayout.pinRight(view: bottomValueLabel, withMargin: PXLayout.M_MARGIN).isActive = true

        //Value labels content view layout
        contentView.addSubview(valueLabelsContainer)
        PXLayout.pinRight(view: valueLabelsContainer, withMargin: PXLayout.ZERO_MARGIN).isActive = true
        PXLayout.centerVertically(view: valueLabelsContainer).isActive = true
        PXLayout.setHeight(owner: valueLabelsContainer, height: 39).isActive = true
        PXLayout.put(view: valueLabelsContainer, rightOf: titleLabel, withMargin: PXLayout.XXS_MARGIN).isActive = true
        valueLabelsContainer.pinLastSubviewToBottom(withMargin: PXLayout.ZERO_MARGIN)

        if data.isSelected {
            let selectedIndicatorView = UIView()
            selectedIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            selectedIndicatorView.backgroundColor = ThemeManager.shared.getAccentColor()
            contentView.addSubview(selectedIndicatorView)
            PXLayout.setWidth(owner: selectedIndicatorView, width: 4).isActive = true
            PXLayout.pinTop(view: selectedIndicatorView).isActive = true
            PXLayout.pinBottom(view: selectedIndicatorView).isActive = true
            PXLayout.pinLeft(view: selectedIndicatorView, withMargin: 0).isActive = true
        }
    }
}
