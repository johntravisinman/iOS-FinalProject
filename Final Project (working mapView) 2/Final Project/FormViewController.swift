//
//  ViewController.swift
//  Final Project
//
//  Created by Inman, John (UMSL-Student) on 7/18/18.
//  Copyright © 2018 Inman, John (UMSL-Student). All rights reserved.
//

import UIKit



class FormViewController: UIViewController {
    
    //Create LocationModel object which is an array of locations
    let model = LocationModel()
    
    //Enum of location types
    let types = ["House", "Restaurant", "Work"]
    
    //Picker
    @IBOutlet weak var typePicker: UIPickerView!
    
    //Text Fields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var longField: UITextField!
    
    //Sliders
    @IBOutlet weak var latSlider: UISlider!
    @IBAction func latSliderMoved(_ sender: Any) {
        let currentValue = latSlider.value
        latField.text = String(currentValue)
    }
    @IBOutlet weak var longSlider: UISlider!
    @IBAction func longSliderMoved(_ sender: Any) {
        let currentValue = longSlider.value
        longField.text = String(currentValue)
    }
    
    
    
    //Add Location button outlet and action
    @IBOutlet weak var addLocationButton: UIButton!
    //Action only calls addLocation()
    @IBAction func addLocationTapped(_ sender: Any) {
        addLocation()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting picker delegate and datasource
        typePicker.delegate = self
        typePicker.dataSource = self
        
        //Setting textField delegates
        nameField.delegate = self
        latField.delegate = self
        longField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLocation() {
        //Unwrapping text fields as Strings
        if let name = nameField.text, let stringLat = latField.text, let stringLong = longField.text {
            
            //Converting lat and long Strings to Doubles
            if let lat = Double(stringLat), let long = Double(stringLong) {
                
                let type = types[typePicker.selectedRow(inComponent: 0)]
                
                //Printing location data to the console for debugging purposes
                print("Adding... Name: \(name), Type: \(type), Latitude: \(lat), Longitude: \(long)")
                
                //Calling the addLocation function from LocationModel to add the location to the list
                model.addLocation(name, type, lat, long)
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Preparing")
        guard let destination = segue.destination as? LocationViewController,
            let location = model.getLocation(at: 0)
            else { return }
        destination.model.list.append(location)
        print("FormViewController: \(#function)")
    }
    
    
}

extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //Tells pickerView to show one component at a time
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //Returns the number of items that will be in pickerView
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //Sets the items in picker view to be the items in types[] (Enum on line 18)
        return types[row]
    }
    
}

extension FormViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Called when user hits return on the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //Called when the user begins editing the text field
        return true
    }
}
