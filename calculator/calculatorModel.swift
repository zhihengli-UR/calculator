//
//  calculatorModel.swift
//  calculator
//
//  Created by Hubert Lee on 12/1/14.
//  Copyright (c) 2014 WiseLee. All rights reserved.
//

import Foundation

var usrinput:String = ""



//将用户输入转换成“数字数组”和“运算符数组”
func transformUsrinput (str: String)->([Double], [String]){
    var arrNumber:[Double] = []
    var arrOperator:[String] = []
    var arr4Operators = ["+", "-", "*", "/"]
    
    //将传入的字符串以+-*/为标志进行分割，将所有数存入arrTemp数组
    var arrTemp = str.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "+-*/"))
    
    //将所有数从String转换成Double类型，然后存入arrNumber数组
    for item in arrTemp {
        arrNumber.append((item as NSString).doubleValue)
    }
    //将字符串中的+-*/存入arrOperator数组
    for i in str {
        for j in arr4Operators {
            if String(i) == j {
                arrOperator.append(j)
            }
        }
    }
    
    return (arrNumber, arrOperator)
}


//乘除法运算
func doMutiplyandDivide(arrNumber: [Double], arrOperator: [String])->([Double], [String]) {
    var didMDArrNumber = arrNumber
    var removeMDOperator = arrOperator
    for var i = 0; i < removeMDOperator.count; i++ {
        if removeMDOperator[i] == "*" || removeMDOperator[i] == "/" {
            if removeMDOperator[i] == "/" {
                if didMDArrNumber[i+1] != 0 {
                    var temp1 = didMDArrNumber[i] / didMDArrNumber[i+1]
                    println(temp1)
                    didMDArrNumber.removeAtIndex(i)
                    didMDArrNumber.removeAtIndex(i)
                    removeMDOperator.removeAtIndex(i)
                    didMDArrNumber.insert(temp1, atIndex: i)
                    i = 0
                }
                else {
                    println("错误！被除数不能为0！")
                }
            }
            else if removeMDOperator[i] == "*" {
                var temp2 = didMDArrNumber[i] * didMDArrNumber[i+1]
                println(temp2)
                didMDArrNumber.removeAtIndex(i)
                didMDArrNumber.removeAtIndex(i)
                didMDArrNumber.insert(temp2, atIndex: i)
                removeMDOperator.removeAtIndex(i)
                i = 0
            }
        }
    }
    return (didMDArrNumber, removeMDOperator)
}




//判断数字
func isNumber(c:String)->Bool {
    if c >= "0" && c <= "9" {
        return true
    }
    else {
        return false
    }
}


//判断字母
func isChar(c:String)->Bool {
    if c >= "a" && c <= "z" {
        return true
    }
    else {
        return false
    }
}


//判断运算符
func isNotation(c:String)->Bool {
    if c == "+" || c == "-" || c == "*" || c == "/" {
        return true
    }
    else {
        return false
    }
}
