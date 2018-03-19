//
//  ViewController.swift
//  pickerView
//
//  Created by gdcp on 2018/3/19.
//  Copyright © 2018年 gdcp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
         为UIPickerView设置数据源（目的：设置选择器视图要显示的列数及对应的行数）
         (1)所在的控制器类遵循协议UIPickerViewDataSource
         (2)设置数据源对象为当前的控制器实例
         (3)实现数据源协议中的方法
         
         为UIPickerView设置代理（目的：设置选择器视图每一个单元格要显示文本及单元格的高度等）
         (1)所在的控制器类遵循协议UIPickerViewDelegate
         (2)设置代理对象为当前的控制器实例
         (3)实现代理协议中的方法
         */

        let pickerView = UIPickerView()
        
            pickerView.frame = CGRect(x: 10, y: 200, width: 350, height: 100)
            pickerView.dataSource = self
        pickerView.delegate = self
        self.view.addSubview(pickerView)
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 10
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component),\(row)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

