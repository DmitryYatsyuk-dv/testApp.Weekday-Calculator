//
//  ViewController.swift
//  WeekDayFinder
//
//  Created by Lucky on 04/01/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findWeekDay() {
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
       
        // Извлечение опционалов
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {return}
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "ru_RU") // Чтобы сделать на русском языке #1
        dateFormatter.dateFormat = "EEEE" //http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
        
        let weekday = dateFormatter.string(from: date)
//        let capitalizedWeekday = weekday.capitalized // Чтобы сделать на русском языке #2
        
        resultLabel.text = weekday
//        resultLabel.text = capitalizedWeekday // Чтобы сделать на русском языке #3
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // Касание экрана - убирает клавиатуру!
    }
    
}

