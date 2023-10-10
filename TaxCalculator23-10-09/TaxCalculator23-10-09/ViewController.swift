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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapCalculateButton(_ sender: Any) {
        if let text = excludingTaxTextField.text,
           let excludingTax = Double(text),
           let tax = taxRateTextField.text,
           let taxRate = Double(tax) {
            let ans = calculateIncludingTax(excludingTax: excludingTax, taxRate: taxRate)
            includingTaxLabel.text = "\(Int(ans))"
        }
    }

    private func calculateIncludingTax(excludingTax: Double, taxRate: Double) -> Double {
        return excludingTax + excludingTax * taxRate / 100
    }
}

