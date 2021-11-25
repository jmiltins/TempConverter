//
//  ViewController.swift
//  TempConverter
//
//  Created by janis.miltins on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegmentcontrol: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celsiusLabel.text = "Please Move the slider!"
        convertedTempLabel.text = "Please Move the slider!"
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        print("tempSlider: ", tempSlider.value)
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    func updateTempLabelForSlider(value: Float){
    let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) °C"
    
    var convertedTempString = ""
        switch tempSegmentcontrol.selectedSegmentIndex{
        case 0:
            let fahreinheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
            convertedTempString = fahreinheitTempString + " °F"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " K"
        }
        convertedTempLabel.text = convertedTempString
    
    
    }
    func convertTempFrom(celsius: Int) ->(fahrenheit: Double, kelvin: Double){
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
    
    
}

