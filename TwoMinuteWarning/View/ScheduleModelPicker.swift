//
//  DateModelPicker.swift
//  TwoMinuteWarning
//
//  Created by Rob Fitzgerald on 9/22/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit

class ScheduleModelPicker: UIPickerView
{
    var modelData: [ScheduleModel]!
    let customWidth: CGFloat = 100
    let customHeight: CGFloat = 100
    var rotationAngle: CGFloat!
}

extension ScheduleModelPicker: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return modelData.count
    }
    
}

extension ScheduleModelPicker: UIPickerViewDelegate
{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modelData[row].scheduleName
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        rotationAngle = 90 * (.pi/180)
        
        let myCounter = 8
        for myCounter in 0..<myCounter {
            print("\(modelData[myCounter].time)")
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        let topLabel = UILabel(frame: CGRect(x:0, y:10, width: customWidth, height: 15))
        topLabel.text = modelData[row].scheduleName
        topLabel.textColor = .black
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightBold )
        view.addSubview(topLabel)
        
        let middleLabel = UILabel(frame: CGRect(x:0, y:0, width: customWidth, height: customHeight))
        middleLabel.text = "Period \(modelData[row].period)"
        middleLabel.textColor = .black
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightThin)
        view.addSubview(middleLabel)
        
        let bottomLabel = UILabel(frame: CGRect(x:0, y:78, width: customWidth, height: 15))
        bottomLabel.text = modelData[row].time
        bottomLabel.textColor = .black
        bottomLabel.textAlignment = .center
        bottomLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        view.addSubview(bottomLabel)
        
        view.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        return view
    }
}

