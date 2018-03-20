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
        
        
        //UIButton layerDemo
        let btn = UIButton(frame: CGRect(x: 100, y: 500, width: 100, height: 100))
        btn.backgroundColor = UIColor.red
        /*
        btn.layer.masksToBounds = true //设置对视图边界修饰
        btn.layer.cornerRadius = 20 //设置圆角半径
        */
        
        /*
         btn.layer.borderColor = UIColor.green.cgColor  //边框颜色
         //注意点：borderColor属性的类型是cgColor，所以要求赋值时要使用颜色的cgColor属性
         btn.layer.borderWidth = 5   //边框宽度
         */
        
        btn.layer.shadowColor = UIColor.gray.cgColor    //阴影颜色
        btn.layer.shadowOffset = CGSize(width: -20, height: -20)   //阴影偏移
        //注意点：width(左右方向)和height(上下方向)两个参数可以是负数，正数表示向右、下方向有阴影，负数表示向左、上方向有阴影
        btn.layer.shadowOpacity = 0.5     //阴影透明度  1为不透明 0为透明
        
        
        self.view.addSubview(btn)
       
        
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
    
    //👋触摸了屏幕后触发的事件
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        //创建警告控制器实例
        let alert = UIAlertController(title: "警告", message: "拒绝访问", preferredStyle: .alert)
        //添加按钮  UIAlertAction封装了触发方法的选项按钮
        let actionConfirm = UIAlertAction(title: "确定", style: .default) { (UIAlertAction) in
            print("confirm")
        }//注意点：handler参数是函数类型，表示单击按钮后要执行的方法
        let actionCancel = UIAlertAction(title: "cancel", style: .cancel) { (UIAlertAction) in
            print("cancel")
        }
        alert.addAction(actionConfirm)
        alert.addAction(actionCancel)
        //以模式框方式显示视图控制器实例
        self.present(alert, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

