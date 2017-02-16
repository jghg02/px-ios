//
//  ApprovedTableViewCell.swift
//  MercadoPagoSDK
//
//  Created by Eden Torres on 10/26/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

class ApprovedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var paymentId: UILabel!
    @IBOutlet weak var installments: UILabel!
    @IBOutlet weak var installmentRate: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var paymentMethod: UIImageView!
    @IBOutlet weak var lastFourDigits: UILabel!
    @IBOutlet weak var statement: UILabel!
    @IBOutlet weak var comprobante: UILabel!
    @IBOutlet weak var idInstallmentConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var paymentMethodStatementDescriptionConstraint: NSLayoutConstraint!
    @IBOutlet weak var paymentMethodTotalConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        emptyTextLabel()
        setFonts()
    }
    
    func fillCell(paymentResult: PaymentResult){
        
        let currency = CurrenciesUtil.getCurrencyFor(paymentResult.currencyId) ?? CurrenciesUtil.getCurrencyFor("ARS")!
        
        fillID(id: paymentResult._id)
        
        if let payerCost = paymentResult.paymentData?.payerCost {
            fillInstallmentLabel(amount: payerCost.totalAmount, installments: payerCost.installments, currency: currency)
            fillInterestLabel(payerCost: payerCost)
            fillTotalLabel(payerCost: payerCost, currency: currency)
            
        } else if let amount = paymentResult.amount{
            fillInstallmentLabel(amount: amount, currency: currency)
            paymentMethodTotalConstraint.constant = 0
        }
        
        fillPaymentMethodIcon(paymentMethod: paymentResult.paymentData?.paymentMethod)
        
        fillPaymentMethodDescriptionLabel(paymentMethod: paymentResult.paymentData?.paymentMethod, token: paymentResult.paymentData?.token)
        
        fillStatementDescriptionLabel(description: paymentResult.statementDescription)
        
        
    }
    
    func fillID(id: String?){
        if !String.isNullOrEmpty(id) {
            comprobante.text = "Comprobante".localized
            paymentId.text = "Nº \(id!)"
            
        } else {
            idInstallmentConstraint.constant = 0
        }
    }
    
    func fillInstallmentLabel(amount: Double, installments: Int = 0, currency: Currency) {
        var installmentNumber = ""
        if installments != 0 {
            installmentNumber = "\(installments) x "
        }
        if amount != 0 {
            
            let totalAmount = Utils.getAttributedAmount(amount, thousandSeparator: String(currency.thousandsSeparator), decimalSeparator: String(currency.decimalSeparator), currencySymbol: String(currency.symbol), color:UIColor.black, fontSize: 24, centsFontSize: 11, baselineOffset:11)
            let installmentLabel = NSMutableAttributedString(string: installmentNumber, attributes: [NSFontAttributeName: Utils.getFont(size: 24)])
            installmentLabel.append(totalAmount)
            self.installments.attributedText =  installmentLabel
        }
    }
    
    func fillInterestLabel(payerCost: PayerCost) {
        if payerCost.installments > 1 && payerCost.installmentRate == 0 {
            installmentRate.text = "Sin interés".localized
        }
    }
    
    func fillTotalLabel(payerCost: PayerCost, currency: Currency) {
        if payerCost.totalAmount != 0 && payerCost.installments != 0{
            let attributedTotal = NSMutableAttributedString(attributedString: NSAttributedString(string: "( ", attributes: [NSForegroundColorAttributeName : UIColor.black, NSFontAttributeName: Utils.getFont(size: 16)]))
            attributedTotal.append(Utils.getAttributedAmount(payerCost.totalAmount, thousandSeparator: String(currency.thousandsSeparator), decimalSeparator: String(currency.decimalSeparator), currencySymbol: String(currency.symbol), color: UIColor.black, fontSize:16, baselineOffset:4))
            attributedTotal.append(NSAttributedString(string: " )", attributes: [NSForegroundColorAttributeName : UIColor.black, NSFontAttributeName: Utils.getFont(size: 16)]))
            total.attributedText = attributedTotal
        } else {
            paymentMethodTotalConstraint.constant = 0
        }
    }
    
    func fillPaymentMethodIcon(paymentMethod: PaymentMethod?){
        self.paymentMethod.image = MercadoPago.getImage(paymentMethod?._id)
    }
    
    func fillPaymentMethodDescriptionLabel(paymentMethod: PaymentMethod?, token: Token?){
        if let token = token {
            self.lastFourDigits.text = "Terminada en ".localized + String(describing: token.lastFourDigits!)
        } else if let paymentMethod = paymentMethod {
            self.lastFourDigits.text = paymentMethod._id == "account_money" ? "Dinero en cuenta de MercadoPago".localized : ""
        }
    }
    
    func fillStatementDescriptionLabel(description: String?) {
        if !String.isNullOrEmpty(description) {
            statement.text = ("En tu estado de cuenta verás el cargo como %0".localized as NSString).replacingOccurrences(of: "%0", with: "\(description!)")
        } else {
            paymentMethodStatementDescriptionConstraint.constant = 0
        }
    }
    
    func emptyTextLabel() {
        total.text = ""
        installmentRate.text = ""
        paymentId.text = ""
        comprobante.text = ""
        statement.text = ""
        installments.text = ""
        lastFourDigits.text = ""
    }
    
    func setFonts() {
        installmentRate.font = Utils.getFont(size: installmentRate.font.pointSize)
        comprobante.font = Utils.getFont(size: comprobante.font.pointSize)
        paymentId.font = Utils.getFont(size: paymentId.font.pointSize)
        statement.font = Utils.getFont(size: statement.font.pointSize)
        lastFourDigits.font = Utils.getFont(size: lastFourDigits.font.pointSize)
    }
}
