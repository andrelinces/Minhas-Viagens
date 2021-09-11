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
        
        //Método reconhecedor de gestos, para identificar quando o usuário mantém a localização pressionada por 2 segundos.
        let reconhecedorGestos = UILongPressGestureRecognizer(target: self, action: #selector( ViewController.marcar ) )
        reconhecedorGestos.minimumPressDuration = 2
        
        mapa.addGestureRecognizer( reconhecedorGestos )
    }
    //Método criado para marcar o ponto pressionado pelo usuário
    @objc func marcar (gesture: UIGestureRecognizer){
        //Faz tratamento de capturar apenas o momento em que satisfaz a condição dos 2 segundos pressionado, gerando apenas uma marcação.
        if gesture.state == UIGestureRecognizer.State.began {
            //print apenas para testar se o método está funcionando corretamente.
            print("Pressionado !!")
        
            //Recupera as coordenadas do ponto que foi pressionado (selecionado)
            let pontoSelecionado = gesture.location( in: self.mapa)
            let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)
            
            //Exibe anotação com os dados do endereço
            let anotacao = MKPointAnnotation()
            
            anotacao.coordinate.latitude = coordenadas.latitude
            anotacao.coordinate.longitude = coordenadas.longitude
            anotacao.title = "Pressionei aqui !"
            anotacao.title = "Estou aqui !"
            
            mapa.addAnnotation( anotacao )
            
        }
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
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse {
            
            let alertController = UIAlertController(title: "Permissão de Localização!!",
                                                    message: "Necessário permitir acesso a sua localização para o funcionamento do APP!",
                                                    preferredStyle: .alert)
            
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir Configurações!", style: .default) { ( alertaConfiguracoes ) in
                
                if let configuracoes = NSURL( string: UIApplication.openSettingsURLString ){
                    UIApplication.shared.open( configuracoes as URL)
                    
                }
                }
                
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            alertController.addAction( acaoConfiguracoes )
            alertController.addAction(acaoCancelar)
            
            present(alertController, animated: true, completion: nil)
            
            }
            
        }
        }
        
        
    
    
    




