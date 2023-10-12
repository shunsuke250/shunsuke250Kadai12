//
//  ViewController.swift
//  TaxCalculator23-10-09
//
//  Created by 副山俊輔 on 2023/10/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var excludingTaxTextField: UITextField!
    @IBOutlet private weak var taxRateTextField: UITextField!
    @IBOutlet private weak var includingTaxLabel: UILabel!

    private let taxRateKey = "taxRate"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTaxRate()
    }

    @IBAction private func didTapCalculateButton(_ sender: UIButton) {
        if let text = excludingTaxTextField.text,
           let excludingTax = Double(text),
           let tax = taxRateTextField.text,
           let taxRate = Double(tax) {
            let ans = calculateIncludingTax(excludingTax: excludingTax, taxRate: taxRate)
            saveTaxRate(taxRate: taxRate)
            includingTaxLabel.text = "\(Int(ans))"
        }
    }

    private func calculateIncludingTax(excludingTax: Double, taxRate: Double) -> Double {
        excludingTax + excludingTax * taxRate / 100
    }

    private func saveTaxRate(taxRate: Double) {
        UserDefaults.standard.setValue(taxRate, forKey: taxRateKey)
    }

    private func loadTaxRate() {
        if let savedTaxRate = UserDefaults.standard.value(forKey: taxRateKey) as? Double {
            taxRateTextField.text = "\(Int(savedTaxRate))"
        }
    }
}
