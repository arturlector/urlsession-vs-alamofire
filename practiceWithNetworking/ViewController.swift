//
//  ViewController.swift
//  practiceWithNetworking
//
//  Created by Григорий Виняр on 03.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PostData().postDataWithURLSession()
        //PostData().postDataWithAlamofire()
        
        //GetData().getDataWithUrlSession()
        //GetData().getDataWithAlamofire()
        
        //PatchData().patchDataWithURLSession()
        //PatchData().patchDataWithAlamofire()
        
        //PutData().putDataWithUrlSession()
        //PutData().putDataWithAlamofire()
        
        //DeleteData().deleteWithUrlSession()
        DeleteData().deleteWithAlamofire()
    }


}

