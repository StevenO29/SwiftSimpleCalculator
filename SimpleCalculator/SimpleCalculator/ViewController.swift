//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by MacBook Pro on 30/09/23.
//

import UIKit

class ViewController: UIViewController {

    var simpanAngka = 0
    var tempAngka = 0
    var cekDesimal = false
    var angkaPertama = 0
    var angkaKedua = 0
    let formatAngka = NumberFormatter()
    var currentOperation : String?
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var allClearBtn: UIButton!
    
    func allClear() {
        if simpanAngka != 0 {
            simpanAngka = 0
            inputLabel.text = "0"
            allClearBtn.setTitle("AC", for: .normal)
        } else {
            simpanAngka = 0
            inputLabel.text = "0"
            resultLabel.text = ""
            allClearBtn.setTitle("AC", for: .normal)
            cekDesimal = false
            angkaPertama = 0
            angkaKedua = 0
            currentOperation = nil
        }
    }
    
    func updateFormatAngka() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let hasilFormat = formatter.string(from: NSNumber(value: simpanAngka)) {
            inputLabel.text = hasilFormat
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allClearBtn.setTitle("AC", for: .normal)
        allClear()
        formatAngka.numberStyle = .decimal
        formatAngka.maximumFractionDigits = 6
        // Do any additional setup after loading the view.
    }
    
    @IBAction func zero(_ sender: Any) {
        if simpanAngka != 0 {
            simpanAngka *= 10
        }
        updateFormatAngka()
    }
    
    @IBAction func one(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 1
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 1
        }
        updateFormatAngka()
    }
    
    @IBAction func two(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 2
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 2
        }
        updateFormatAngka()
    }
    
    @IBAction func three(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 3
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 3
        }
        updateFormatAngka()
    }
    
    @IBAction func four(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 4
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 4
        }
        updateFormatAngka()
    }
    
    @IBAction func five(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 5
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 5
        }
        updateFormatAngka()
    }
    
    @IBAction func six(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 6
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 6
        }
        updateFormatAngka()
    }
    
    @IBAction func seven(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 7
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 7
        }
        updateFormatAngka()
    }
    
    @IBAction func eight(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 8
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 8
        }
        updateFormatAngka()
    }
    
    @IBAction func nine(_ sender: Any) {
        if simpanAngka == 0 {
            simpanAngka = 9
            allClearBtn.setTitle("C", for: .normal)
        } else {
            simpanAngka = simpanAngka * 10 + 9
        }
        updateFormatAngka()
    }
    
    @IBAction func comma(_ sender: Any) {
        if !cekDesimal {
            simpanAngka *= 10
            simpanAngka += 0
            cekDesimal = true
            updateFormatAngka()
        }
    }
    
    @IBAction func allClearBtn(_ sender: Any) {
        allClear()
    }
    
    @IBAction func plusMinBtn(_ sender: Any) {
        simpanAngka = -simpanAngka
            updateFormatAngka()
    }
    
    @IBAction func percentBtn(_ sender: Any) {
        simpanAngka = simpanAngka / 100
        updateFormatAngka()
    }
    
    @IBAction func divBtn(_ sender: Any) {
        angkaPertama = simpanAngka
        simpanAngka = 0
        currentOperation = "divide"
    }
    
    @IBAction func multiply(_ sender: Any) {
        angkaPertama = simpanAngka
        simpanAngka = 0
        currentOperation = "multiply"
    }
    
    @IBAction func minus(_ sender: Any) {
        angkaPertama = simpanAngka
        simpanAngka = 0
        currentOperation = "minus"
    }
    
    @IBAction func plus(_ sender: Any) {
        angkaPertama = simpanAngka
        simpanAngka = 0
        currentOperation = "plus"
    }
    
    @IBAction func equal(_ sender: Any) {
        inputLabel.text = ""
        if let operation = currentOperation {
            switch operation {
            case "divide":
                if angkaPertama != 0 {
                    if simpanAngka != 0 {
                        let hasil = Double(angkaPertama) / Double(angkaKedua)
                        if let formattedResult = formatAngka.string(from: NSNumber(value: hasil)) {
                            resultLabel.text = formattedResult
                        }
                    } else {
                        resultLabel.text = "Error"
                    }
                }
            case "multiply":
                if angkaPertama != 0 {
                    if angkaKedua == 0 {
                        angkaKedua = simpanAngka
                    } else {
                        angkaKedua *= simpanAngka
                    }
                    let hasil = angkaPertama * angkaKedua
                    if let formattedResult = formatAngka.string(from: NSNumber(value: hasil)) {
                        resultLabel.text = formattedResult
                    }
                }
            case "minus":
                if angkaPertama != 0 {
                    if angkaKedua == 0 {
                        angkaKedua = simpanAngka
                    } else {
                        angkaKedua -= simpanAngka
                    }
                    let hasil = angkaPertama - angkaKedua
                    if let formattedResult = formatAngka.string(from: NSNumber(value: hasil)) {
                        resultLabel.text = formattedResult
                    }
                }
            case "plus":
                if angkaPertama != 0 {
                    if angkaKedua == 0 {
                        angkaKedua = simpanAngka
                    } else {
                        angkaKedua += simpanAngka
                    }
                    let hasil = angkaPertama + angkaKedua
                    if let formattedResult = formatAngka.string(from: NSNumber(value: hasil)) {
                        resultLabel.text = formattedResult
                    }
                }
            default:
                break
            }
        }
    }
}
