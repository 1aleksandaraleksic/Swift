//
//  DataPreparation.swift
//  CatalogOfCars
//
//  Created by aleksandar.aleksic on 6/2/21.
//

import Foundation

struct DataPreparation{

    static var cars: [Car] = []
    static var selectedManufacturerWithModel: [Car] = []
    static var carManufacturers: [String] = []
    static var filteredCarManufacturers: [String] = []
    
    static var selectedCar: Car? = nil
    static var arrayOfSelectedCarDetail: Dictionary<Int , [Any]> = [:]
    
       
    static func formatPriceOfCar(_ price: Double) -> String{        
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        return "\(numberFormatter.string(from: price as NSNumber)!) EUR"
    }
    
    static func selectedModel(selectedManufacturerID: Int){
        selectedManufacturerWithModel =
            cars.filter{ $0.marka == filteredCarManufacturers[selectedManufacturerID] }
    }
    
    static func searchByModelOrManufacturer(textForSearch: String){
        if textForSearch == "" || textForSearch.isEmpty{
            filteredCarManufacturers = carManufacturers
            filteredCarManufacturers.sort()
            return
        }
        
        filteredCarManufacturers = []
        
        for carName in carManufacturers{
            if carName.lowercased().contains(textForSearch.lowercased()){
                filteredCarManufacturers.append(carName)
            }
        }
        
        if filteredCarManufacturers.count == 1 {
            return
        }else{
            for car in cars{
                if car.model!.lowercased().contains(textForSearch.lowercased()){
                    if !filteredCarManufacturers.contains(car.marka!){
                        filteredCarManufacturers.append(car.marka!)
                    }
                }
            }
        }
    }
    
    static func manufacturerByName(){
        var manufacturerList:Set<String> = []
        
        for manufacturer in cars {
            manufacturerList.insert(manufacturer.marka!)
        }
      
        DataPreparation.carManufacturers = Array(manufacturerList)
        carManufacturers.sort()
        filteredCarManufacturers = carManufacturers
    }
    
    static func transformCarDetailToDictionary(){
        if let car = selectedCar{
            arrayOfSelectedCarDetail[0] = ["Marka", car.marka!]
            arrayOfSelectedCarDetail[1] = ["Model", car.model!]
            arrayOfSelectedCarDetail[2] = ["Engin", car.motor!.ime!]
            arrayOfSelectedCarDetail[3] = ["Equipment Package", car.paketOpreme!]
            arrayOfSelectedCarDetail[4] = ["Price", formatPriceOfCar(car.cena ?? 0.0)] 
            arrayOfSelectedCarDetail[5] = ["Cylinder arrangement", car.motor!.rasporedCilindra!]
            arrayOfSelectedCarDetail[6] = ["Number of Valves", car.motor!.brojVentila!]
            arrayOfSelectedCarDetail[7] = ["Piston stroke diameter", car.motor!.precnikHodaKlipa!]
            arrayOfSelectedCarDetail[8] = ["Injection type", car.motor!.tipUbrizgavanja!]
            arrayOfSelectedCarDetail[9] = ["Valve opening system", car.motor!.sistemOtvaranjaVentila!]
            arrayOfSelectedCarDetail[10] = ["Turbo", car.motor!.turbo!]
            arrayOfSelectedCarDetail[11] = ["Engine capacity", car.motor!.zapreminaMotora!]
            arrayOfSelectedCarDetail[12] = ["KW", car.motor!.kw!]
            arrayOfSelectedCarDetail[13] = ["KS", car.motor!.ks!]
            arrayOfSelectedCarDetail[14] = ["Power at revolutions,", car.motor!.snagaPriObrtajima!]
            arrayOfSelectedCarDetail[15] = ["Torque", car.motor!.obrtniMoment!]
            arrayOfSelectedCarDetail[16] = ["torque at revolutions", car.motor!.obrtniMomentPriObrtajima!]
            arrayOfSelectedCarDetail[17] = ["Degree of compression", car.motor?.stepenKompresije ?? 0.0]
            arrayOfSelectedCarDetail[18] = ["Gearbox type", car.motor!.tipMenjaca!]
            arrayOfSelectedCarDetail[19] = ["Number of gears", car.motor!.brojStepenaPrenosa!]
            arrayOfSelectedCarDetail[20] = ["Drive", car.motor!.pogon!]
            arrayOfSelectedCarDetail[21] = ["Length", car.karakteristike!.duzina!]
            arrayOfSelectedCarDetail[22] = ["Width", car.karakteristike!.sirina!]
            arrayOfSelectedCarDetail[23] = ["Height", car.karakteristike!.visina!]
            arrayOfSelectedCarDetail[24] = ["Wheelbase", car.karakteristike!.medjuosovinskoRastojanje!]
            arrayOfSelectedCarDetail[25] = ["Empty cehicle weight", car.karakteristike!.tezinaPraznogVozila!]
            arrayOfSelectedCarDetail[26] = ["Maximum permissible weight", car.karakteristike!.maksimalnoDozvoljenaTezina!]
            arrayOfSelectedCarDetail[27] = ["Tank volume", car.karakteristike!.zapreminaRezervoara!]
            arrayOfSelectedCarDetail[28] = ["Trunk volume", car.karakteristike!.zapreminaPrtljaznika!]
            arrayOfSelectedCarDetail[29] = ["Maximum trunk volume", car.karakteristike!.maxZapreminaPrtljaznika!]
            arrayOfSelectedCarDetail[30] = ["Allowed load", car.karakteristike!.dozvoljenTovar!]
            arrayOfSelectedCarDetail[31] = ["Permissible roof load", car.karakteristike!.dozvoljenoOpterecenjeKrova!]
            arrayOfSelectedCarDetail[32] = ["Permissible trailer weight BK", car.karakteristike!.dozvoljenaTezinaPrikolicaBK!]
            arrayOfSelectedCarDetail[33] = ["Permissible trailer weight SK12", car.karakteristike!.dozvoljenaTezinaPrikoliceSK12!]
            arrayOfSelectedCarDetail[34] = ["Permissible trailer weight SK8", car.karakteristike!.dozvoljenaTezinaPrikoliceSK8!]
            arrayOfSelectedCarDetail[35] = ["Hook load", car.karakteristike!.opterecenjeKuke!]
            arrayOfSelectedCarDetail[36] = ["Turning radius", car.tocak?.radijusOkretanja ?? 0.0]
            arrayOfSelectedCarDetail[37] = ["Track Points Forward", car.tocak!.tragTockovaNapred!]
            arrayOfSelectedCarDetail[38] = ["Track Points Back", car.tocak!.tragTockovaNazad!]
            arrayOfSelectedCarDetail[39] = ["Max speed", car.brzina!.maxBrzina!]
            arrayOfSelectedCarDetail[40] = ["Acceleration 0-100", car.brzina?.ubrzanjeOdNulaDoSto ?? 0.0]
            arrayOfSelectedCarDetail[41] = ["Acceleration 0-200", car.brzina!.ubrzanjeOdNulaDoDvesta!]
            arrayOfSelectedCarDetail[42] = ["Acceleration 80-120 final degree", car.brzina!.ubrzanjeFinalniStepen!]
            arrayOfSelectedCarDetail[43] = ["Stopping distance", car.brzina!.zaustavniPutSto!]
            arrayOfSelectedCarDetail[44] = ["Stopping distance 400m", car.brzina!.vremeZaCetristo!]
            arrayOfSelectedCarDetail[45] = ["Consumption city", car.potrosnja!.potrosnjaGrad!]
            arrayOfSelectedCarDetail[46] = ["Consumption outside the city",car.potrosnja!.potrosnjaVanGrada!]
            arrayOfSelectedCarDetail[47] = ["Consumption combined", car.potrosnja!.kombinovanaPotrosnja!]
            arrayOfSelectedCarDetail[48] = ["CO2 emissions", car.motor!.emisijaCO2!]
            arrayOfSelectedCarDetail[49] = ["Catalyst", car.motor!.katalizator!]
            arrayOfSelectedCarDetail[50] = ["Front brakes", car.tocak!.kocioniSistem!.prednjeKocnice!]
            arrayOfSelectedCarDetail[51] = ["Rear brakes", car.tocak!.kocioniSistem!.zadnjeKocnice!]
            arrayOfSelectedCarDetail[52] = ["Tire size", car.tocak!.dimenzijaPneumatika!]
            arrayOfSelectedCarDetail[53] = ["Front suspension", car.sistemZaOslanjanje!.prednjeVesanje!]
            arrayOfSelectedCarDetail[54] = ["Rear suspension", car.sistemZaOslanjanje!.zadnjeVesanje!]
            arrayOfSelectedCarDetail[55] = ["Front springs", car.sistemZaOslanjanje!.prednjeOpruge!]
            arrayOfSelectedCarDetail[56] = ["Rear springs", car.sistemZaOslanjanje!.zadnjeOpruge!]
            arrayOfSelectedCarDetail[57] = ["Front stabilizer", car.sistemZaOslanjanje!.prednjiStabilizator!]
            arrayOfSelectedCarDetail[58] = ["Rear stabilizer", car.sistemZaOslanjanje!.zadnjiStabilizator!]
            arrayOfSelectedCarDetail[59] = ["Corrosion warranty", car.dodatno!.grancijaKorozija!]
            arrayOfSelectedCarDetail[60] = ["Engine warranty", car.dodatno!.garancijaMotora!]
            arrayOfSelectedCarDetail[61] = ["Euro NCAP", car.dodatno!.euroNCAP!]
            arrayOfSelectedCarDetail[62] = ["Euro NCAP star", car.dodatno!.euroNCAPzvezdice!]
            arrayOfSelectedCarDetail[63] = ["Fuel", car.motor!.gorivo!]
            arrayOfSelectedCarDetail[64] = ["Number of doors", car.karakteristike?.brojVrata ?? 0]
            arrayOfSelectedCarDetail[65] = ["Number of seats", car.karakteristike?.brojSedista ?? 0]
        }



    }
    
    // /////////////////////////////////////
    //           Parsing Model        //
    // /////////////////////////////////////

    static func parseDataToModelCar(fileName: String, fileExtension: String) {
        
        let path = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        let fileExist = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)

        if let fileContent = fileExist{
        let lineByLineArray = fileContent.split(separator: "\n")

            for row in lineByLineArray{
                
                let lineToArray = row.split(separator: ";")
                
                let marka = String(lineToArray[0])
                let model = String(lineToArray[1])
                let imeMotora = String(lineToArray[2])
                let paketOpreme = String(lineToArray[3])
                let cena = Double(lineToArray[4])
                let rasporedCilindra = String(lineToArray[5])
                let brojVentila = Int(lineToArray[6])
                let precnikHodaKlipa = String(lineToArray[7])
                let tipUbrizgavanja = String(lineToArray[8])
                let sistemOtvaranjaVentila = String(lineToArray[9])
                let turbo = String(lineToArray[10])
                let zapreminaMotora = Int(lineToArray[11])
                let kw = Int(lineToArray[12])
                let ks = Int(lineToArray[13])
                let snagaPriObrtajima = String(lineToArray[14])
                let obrtniMoment = Int(lineToArray[15])
                let obrtniMomentPriObrtajima = String(lineToArray[16])
                let stepenKompresije = Double(lineToArray[17])
                let tipMenjaca = String(lineToArray[18])
                let brojStepenaPrenosa = Int(lineToArray[19])
                let pogon = String(lineToArray[20])
                let duzina = Double(lineToArray[21])
                let sirina = Double(lineToArray[22])
                let visina = Double(lineToArray[23])
                let medjuosovinskoRastojanje = Double(lineToArray[24])
                let tezinaPraznogVozila = Double(lineToArray[25])
                let maxDozvoljenaTezina = Double(lineToArray[26])
                let zapreminaRezervoara = Double(lineToArray[27])
                let zapreminaPrtljaznika = Double(lineToArray[28])
                let maxZapreminaPrtljaznika = Double(lineToArray[29])
                let dozvoljenTovar = Double(lineToArray[30])  ?? 0.0
                let dozvoljenoOpterecenjeKrova = Double(lineToArray[31])
                let dozvoljenaTezinaPrikoliceBk = Double(lineToArray[32])
                let dozvoljenaTezinaPrikoliceSK12 = Double(lineToArray[33])
                let dozvoljenaTezinaPrikoliceSK8 = Double(lineToArray[34])
                let opterecenjeKuke = Double(lineToArray[35])
                let radijusOkretanja = Double(lineToArray[36])
                let tragTockovaNapred = String(lineToArray[37])
                let tragTockovaNazad = String(lineToArray[38])
                let maxBrzina = Int(lineToArray[39])
                let ubrzanjeNulaSto = Double(lineToArray[40])
                let ubrzanjeNulaDvesta = Double(lineToArray[41])
                let ubrzanjeFinalniStepen = Double(lineToArray[42])
                let zaustavniPutSto = Double(lineToArray[43])
                let vremeZaCetristo = Double(lineToArray[44])
                let potrosnjaGrad = String(lineToArray[45])
                let potrosnjaVanGrada = String(lineToArray[46])
                let kombinovanaPotrosnja = String(lineToArray[47])
                let emisijaCO2 = String(lineToArray[48])
                let katalizator = String(lineToArray[49])
                let prednjeKocnice = String(lineToArray[50])
                let zadnjeKocnice = String(lineToArray[51])
                let dimenzijaPneumatika = String(lineToArray[52])
                let prednjeVesanje = String(lineToArray[53])
                let zadnjeVesanje = String(lineToArray[54])
                let prednjeOpruge = String(lineToArray[55])
                let zadnjeOpruge = String(lineToArray[56])
                let prednjiStabilizator = String(lineToArray[57])
                let zadnjiStabilizator = String(lineToArray[58])
                let garancijaKorozija = String(lineToArray[59])
                let garancijaMotro = String(lineToArray[60])
                let euroNCAP = String(lineToArray[61])
                let euroNCAPzvezdice = String(lineToArray[62])
                let gorivo = String(lineToArray[63])
                let brojVrata = Int(lineToArray[64])
                let brojSedista = Int(lineToArray[65])
                
                let newCar =
                    Car(marka: marka,
                        model: model,
                        motor:
                            Motor(ime: imeMotora,
                                  rasporedCilindra: rasporedCilindra,
                                  brojVentila: brojVentila,
                                  precnikHodaKlipa: precnikHodaKlipa,
                                  tipUbrizgavanja: tipUbrizgavanja,
                                  sistemOtvaranjaVentila: sistemOtvaranjaVentila,
                                  turbo: turbo,
                                  zapreminaMotora: zapreminaMotora,
                                  kw: kw,
                                  ks: ks,
                                  snagaPriObrtajima: snagaPriObrtajima,
                                  obrtniMoment: obrtniMoment,
                                  obrtniMomentPriObrtajima: obrtniMomentPriObrtajima,
                                  stepenKompresije: stepenKompresije,
                                  tipMenjaca: tipMenjaca,
                                  brojStepenaPrenosa: brojStepenaPrenosa,
                                  pogon: pogon,
                                  emisijaCO2: emisijaCO2,
                                  katalizator: katalizator,
                                  gorivo: gorivo),
                        paketOpreme: paketOpreme,
                        cena: cena,
                        karakteristike:
                            Karakteristike(duzina: duzina,
                                           sirina: sirina,
                                           visina: visina,
                                           medjuosovinskoRastojanje: medjuosovinskoRastojanje,
                                           tezinaPraznogVozila: tezinaPraznogVozila,
                                           maksimalnoDozvoljenaTezina: maxDozvoljenaTezina,
                                           zapreminaRezervoara: zapreminaRezervoara,
                                           zapreminaPrtljaznika: zapreminaPrtljaznika,
                                           maxZapreminaPrtljaznika: maxZapreminaPrtljaznika,
                                           dozvoljenTovar: dozvoljenTovar,
                                           dozvoljenoOpterecenjeKrova: dozvoljenoOpterecenjeKrova,
                                           dozvoljenaTezinaPrikolicaBK: dozvoljenaTezinaPrikoliceBk,
                                           dozvoljenaTezinaPrikoliceSK12: dozvoljenaTezinaPrikoliceSK12,
                                           dozvoljenaTezinaPrikoliceSK8: dozvoljenaTezinaPrikoliceSK8,
                                           opterecenjeKuke: opterecenjeKuke,
                                           brojVrata: brojVrata,
                                           brojSedista: brojSedista),
                        brzina:
                            Brzina(maxBrzina: maxBrzina,
                                   ubrzanjeOdNulaDoSto: ubrzanjeNulaSto,
                                   ubrzanjeOdNulaDoDvesta: ubrzanjeNulaDvesta,
                                   ubrzanjeFinalniStepen: ubrzanjeFinalniStepen,
                                   zaustavniPutSto: zaustavniPutSto,
                                   vremeZaCetristo: vremeZaCetristo),
                        tocak:
                            Tocak(radijusOkretanja: radijusOkretanja,
                                  tragTockovaNapred: tragTockovaNapred,
                                  tragTockovaNazad: tragTockovaNazad,
                                  kocioniSistem:
                                    KocioniSistem(prednjeKocnice: prednjeKocnice,
                                                  zadnjeKocnice: zadnjeKocnice),
                                  dimenzijaPneumatika: dimenzijaPneumatika),
                        sistemZaOslanjanje:
                            SistemZaOslanjanje(prednjeVesanje: prednjeVesanje,
                                               zadnjeVesanje: zadnjeVesanje,
                                               prednjeOpruge: prednjeOpruge,
                                               zadnjeOpruge: zadnjeOpruge,
                                               prednjiStabilizator: prednjiStabilizator,
                                               zadnjiStabilizator: zadnjiStabilizator),
                        potrosnja:
                            Potrosnja(potrosnjaGrad: potrosnjaGrad,
                                      potrosnjaVanGrada: potrosnjaVanGrada,
                                      kombinovanaPotrosnja: kombinovanaPotrosnja),
                        dodatno:
                            Dodatno(grancijaKorozija: garancijaKorozija,
                                    garancijaMotora: garancijaMotro,
                                    euroNCAP: euroNCAP,
                                    euroNCAPzvezdice: euroNCAPzvezdice))

                cars.append(newCar)
            }
        }
    }

    
}
