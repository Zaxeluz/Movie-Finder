//
//  ViewController.swift
//  Movie Finder
//
//  Created by Alumno on 24/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var urlMovie : String = ""
    var urlMovieName : String = ""
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    @IBOutlet weak var txtMovieName: UITextField!
    @IBAction func doTapSearch(_ sender: Any) {
        lblTitle.text = ""
        lblYear.text = ""
        lblRate.text = ""
        lblDuration.text = ""
        lblGenre.text = ""
        lblDirector.text = ""
        urlMovieName = txtMovieName.text!
        aiLoading.startAnimating()
        
        if urlMovieName != ""{
            urlMovie = "https://www.omdbapi.com/?apikey=fbf7bf8f&t=\(urlMovieName)"
        
            Alamofire.request(urlMovie).responseJSON{
                response in
                if let dictRespuesta = response.result.value as? NSDictionary{
                    if let Title = dictRespuesta.value(forKey: "Title") as? String{
                        self.lblTitle.text = Title
                    }
                    if let Year = dictRespuesta.value(forKey: "Year") as? String{
                        self.lblYear.text = Year
                    }
                    if let Rated = dictRespuesta.value(forKey: "Rated") as? String{
                        self.lblRate.text = Rated
                    }
                    if let Runtime = dictRespuesta.value(forKey: "Runtime") as? String{
                        self.lblDuration.text = Runtime
                    }
                    if let Genre = dictRespuesta.value(forKey: "Genre") as? String{
                        self.lblGenre.text = Genre
                    }
                    if let Director = dictRespuesta.value(forKey: "Director") as? String{
                        self.lblDirector.text = Director
                    }
                } else {
                    //AVISARLE AL USUARIO QUE NO SE PUDO LEER LA RESPUESTA
                }
            }
            self.aiLoading.stopAnimating()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

