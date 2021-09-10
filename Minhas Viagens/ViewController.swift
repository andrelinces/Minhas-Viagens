//
//  ViewController.swift
//  Minhas Viagens
//
//  Created by Andre Linces on 09/09/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    //Inicializando o objeto
    var gerenciadorLocalizacao = CLLocationManager ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuraGerenciadorLocalizacao()
        
    }
    
    func configuraGerenciadorLocalizacao (){
        
        //Objeto será gerenciado pela própria classe viewController pois já está herdando de Cllocation
        gerenciadorLocalizacao.delegate = self
        //Definindo a precisão
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        //Solicitação de autorização
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        //Atuando a localização do usuário
        gerenciadorLocalizacao.startUpdatingLocation()
        
    }
    
    
    }




