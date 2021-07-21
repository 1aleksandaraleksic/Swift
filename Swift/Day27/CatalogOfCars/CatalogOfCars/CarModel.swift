//
//  CarModel.swift
//  CatalogOfCars
//
//  Created by aleksandar.aleksic on 6/1/21.
//

import Foundation

struct Car{    
    let marka: String?
    let model: String?
    let motor: Motor?
    let paketOpreme: String?
    let cena: Double?
    let karakteristike: Karakteristike?
    let brzina: Brzina?
    let tocak: Tocak?
    let sistemZaOslanjanje: SistemZaOslanjanje?
    let potrosnja: Potrosnja?
    let dodatno: Dodatno?
    
}

struct Motor{
    let ime: String?
    let rasporedCilindra: String?
    let brojVentila: Int?
    let precnikHodaKlipa: String?
    let tipUbrizgavanja: String? //Enum
    let sistemOtvaranjaVentila: String? //Enum
    let turbo: String? //Enum
    let zapreminaMotora: Int?
    let kw: Int?
    let ks: Int?
    let snagaPriObrtajima: String?
    let obrtniMoment: Int?
    let obrtniMomentPriObrtajima: String?
    let stepenKompresije: Double?
    let tipMenjaca: String? //Enum
    let brojStepenaPrenosa: Int? //Enum
    let pogon: String?
    let emisijaCO2: String?
    let katalizator: String?
    let gorivo: String? // Enum
}

struct Karakteristike{
    let duzina: Double?
    let sirina: Double?
    let visina: Double?
    let medjuosovinskoRastojanje: Double?
    let tezinaPraznogVozila: Double?
    let maksimalnoDozvoljenaTezina:Double?
    let zapreminaRezervoara: Double?
    let zapreminaPrtljaznika: Double?
    let maxZapreminaPrtljaznika: Double?
    let dozvoljenTovar: Double?
    let dozvoljenoOpterecenjeKrova: Double?
    let dozvoljenaTezinaPrikolicaBK: Double?
    let dozvoljenaTezinaPrikoliceSK12: Double?
    let dozvoljenaTezinaPrikoliceSK8: Double?
    let opterecenjeKuke: Double?
    let brojVrata: Int?
    let brojSedista: Int?
}

struct Tocak {
    let radijusOkretanja: Double?
    let tragTockovaNapred: String?
    let tragTockovaNazad: String?
    let kocioniSistem: KocioniSistem?
    let dimenzijaPneumatika: String?
}

struct KocioniSistem{
    let prednjeKocnice: String?
    let zadnjeKocnice: String?
}

struct SistemZaOslanjanje{
    let prednjeVesanje: String?
    let zadnjeVesanje: String?
    let prednjeOpruge: String?
    let zadnjeOpruge: String?
    let prednjiStabilizator: String?
    let zadnjiStabilizator: String?
}

struct Brzina{
    let maxBrzina: Int?
    let ubrzanjeOdNulaDoSto: Double?
    let ubrzanjeOdNulaDoDvesta: Double?
    let ubrzanjeFinalniStepen: Double?
    let zaustavniPutSto: Double?
    let vremeZaCetristo: Double?
}

struct Potrosnja {
    let potrosnjaGrad: String?
    let potrosnjaVanGrada: String?
    let kombinovanaPotrosnja: String?
}


struct Dodatno{
    let grancijaKorozija: String?
    let garancijaMotora: String?
    let euroNCAP: String?
    let euroNCAPzvezdice: String?
}
