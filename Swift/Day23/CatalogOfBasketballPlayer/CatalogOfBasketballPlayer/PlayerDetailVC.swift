//
//  PlayerDetailVC.swift
//  CatalogOfBasketballPlayer
//
//  Created by aleksandar.aleksic on 5/27/21.
//

import UIKit

class PlayerDetailVC: UIViewController {

    var player: Player = Player(name: "", surname: "", height: 0, age: 0, image: "", image2: "")
    
    let playerInfo = [
        ["Teodosic","Miloš Teodosić (Valjevo, 19. mart 1987) srpski je košarkaš. Igra na poziciji plejmejkera, a trenutno nastupa za Virtus Bolonju.Karakteriše ga prefinjena tehnika na terenu, sa originalnim asistencijama, često nesvakidašnjim rešenjima i odličnim šutom.[1] Zvanično najbolji igrač Evrope po izboru FIBE 2010. godine, a iste godine je i dobio nagradu za najkorisnijeg igrača Evrolige. Tri puta je izabran u najbolju petorku Evrolige, a isto toliko puta je bio i u drugoj petorci. Osvojio je Evroligu sa ekipom CSKA 2016. godine posle pobede nad turskim Fenerbahčeom. Iste godine je dobio prestižnu nagradu Evroskar za najboljeg evropskog košarkaša. Izabran je u idealan tim decenije Evrolige (2010-20). Standardan je član i kapiten košarkaške reprezentacije Srbije, jedan je od vodećih igrača, a sa reprezentacijom je osvajao medalje na skoro svim takmičenjima."],
        ["Simonovic", "Marko Simonović (Priština, 30. maj 1986) je srpski košarkaš. Igra na pozicijama krila i krilnog centra, a trenutno nastupa za Crvenu zvezdu. Bio je član univerzitetske reprezentacije Srbije, sa kojom je na Letnjim univerzijadama osvojio dve medalje - zlatnu 2009. i srebrnu 2007. godine. Sa seniorskom reprezentacijom debitovao je na Svetskom prvenstvu 2014. u Španiji gde je osvojena srebrna medalja. Simonović je u devet susreta beležio 3,1 poen za prosečno devet minuta u igri i pogodio važna slobodna bacanja u polufinalu protiv Francuske. Za dva poena je šutirao 62,5% (8-5), a za tri 37,5% (8-3). Sa reprezentacijom je osvojio i srebrnu medalju na Olimpijskim igrama u Riju 2016. godine. Igrao je i na Svetskom prvenstvu 2019. u Kini."],
        ["Kuzmic","Ognjen Kuzmić (Doboj, 16. maj 1990) je srpski košarkaš. Igra na poziciji centra, a trenutno nastupa za Crvenu zvezdu. Bio je član ekipe Golden Stejt voriorsa koja je osvojila NBA šampionat. Nastupao je i za reprezentaciju Srbije. Dobio je poziv da igra za reprezentaciju BiH na Evropskom prvenstvu 2013. ali je to odbio. Naredne godine je doneo odluku da nastupa za reprezentaciju Srbije. Zbog povrede je propustio Svetsko prvenstvo 2014. u Španiji. Nastupio je za reprezentaciju Srbije na Evropskim prvenstvima 2015. i 2017. godine."],
        ["Bogdanovic", "Bogdan Bogdanović (Beograd, 18. avgust 1992) srpski je košarkaš. Igra na poziciji beka, a trenutno nastupa za Atlanta hokse. Proglašen je za Evroliginu zvezdu u usponu dva puta uzastopno 2014. i 2015. Osvojio je Evroligu sa Fenerbahčeom 2017. godine i uvršten je u idealni tim Evrolige. Standardan je član seniorske reprezentacije Srbije, jedan je od vodećih igrača i sa reprezentacijom je osvajao medalje na skoro svim takmičenjima. Bogdanov otac se zove Dragan, a majka Koviljka. Ima mlađu sestru Bojanu. Bogdan je završio Elektrotehničku školu „Rade Končar” u Beogradu. Godine 2017. pojavio se u spotu za hip-hop pesmu Plan B koju su snimili DJ Playa, THCF i Gru."],
        ["Bjelica", "Nemanja Bjelica (Beograd 9. maj 1988) je srpski košarkaš. Trenutno nastupa za Minesotu timbervulvse, a takođe je i standardan član košarkaške reprezentacije Srbije. Primarna pozicija mu je krilo ali može da igra i po potrebi na pozicijama plejmejkera i krilnog centra. Godine 2009. bio je izabran za najboljeg sportistu Crvene zvezde. Draftovan je 2010. godine u drugoj rundi NBA drafta. Proglašen je za najkorisnijeg igrača Evrolige 2015. godine, a ujedno je bio i član najbolje petorke ovog takmičenja."],
        ["Markovic", "Stefan Marković (Beograd, 25. april 1988) je srpski košarkaš. Igra na pozicijama plejmejkera i beka, a trenutno nastupa za Virtus Bolonju. Nastupao je u mlađim reprezentativnim selekcijama Srbije. Na Svetskom prvenstvu za mlade igrače do 19 godina 2007. u Novom Sadu osvojio je zlatnu medalju. Za seniorsku reprezentaciju Srbije je prvi put igrao na Evropskom prvenstvu 2007. godine. Sa seniorskim nacionalnim timom osvojio je tri srebra - prvo na Evropskom prvenstvu 2009. u Poljskoj, drugo na Svetskom prvenstvu 2014. u Španiji i treće na Letnjim olimpijskim igrama 2016. u Brazilu. U avgustu 2016. je objavio da se povlači iz reprezentacije."],
        ["Raduljica","Miroslav Raduljica (Inđija, 5. januar 1988) je srpski košarkaš. Igra na poziciji centra, a trenutno je igrač kineskih Đangsu dregonsa. Raduljica je imao dosta uspeha sa reprezentacijom u mlađim kategorijama. Sa reprezentacijom do 18 godina osvojio je Evropsko prvenstvo 2005. u Beogradu, sa reprezentacijom do 19 godina osvojio je Svetsko prvenstvo 2007. u Novom Sadu a sa reprezentacijom do 20 godina osvojio je Evropsko prvenstvo 2008. u Letoniji gde je bio i proglašen najkorisnijim igračem turnira. Kao član univerzitetske reprezentacije Srbije osvojio je zlatnu medalju na Letnjoj univerzijadi 2009. godine u Beogradu. Dobrim partijama u dresu „studenata“ zaslužio je poziv za seniorsku reprezentaciju Srbije koja se pripremala za Evropsko prvenstvo 2009. u Poljskoj. Uspeo je da uđe u konačni sastav i bude deo tima koji je osvojio srebrnu medalju."],
        ["Kalinic", "Nikola Kalinić (Subotica, 8. novembar 1991) je srpski košarkaš. Igra na poziciji krila, a trenutno nastupa za Valensiju. Sin je bivšeg jugoslovenskog stonotenisera Zorana Kalinića. Sa mlađim selekcijama državnog tima 2013. godine je osvojio srebro na Mediteranskim igrama i bronzu na Univerzijadi. Za seniorsku reprezentaciju Srbije debitovao je na Evropskom prvenstvu 2013. godine u Sloveniji. Tadašnji selektor Dušan Ivković ga je uvrstio na širi spisak, što je za mnoge bilo iznenađenje. Ipak, radom i dobrim partijama uspeo je da se probije u 12 igrača koji su nastupali u Sloveniji. Iako nije bio glavna opcija u napadu, zbog odlične odbrane provodio je na parketu preko 20 minuta po meču. Naredne godine na Svetskom prvenstvu u Španiji bio je još zapaženiji. Ušao je u prvu petorku, a naročito se istakao u utakmici osmine finala protiv Grčke kada je postigao 12 poena i imao dva spektakularna zakucavanja. Jedno od njih je izabrano za najbolje zakucavanje, kao i drugi najbolji potez čitavog prvenstva na kojem je reprezentacija Srbije osvojila srebrnu medalju. I u finalu protiv SAD je imao veoma zapaženu ulogu - za dva šutirao je perfektnih 7/7 i ukupno postigao 18 poena, tako da je uz Nemanju Bjelicu bio najefikasniji srpski igrač u tom susretu. Šampionat je završio sa prosečnim učinkom od 7,2 poena i 1,9 skokova po meču, a imao je najbolje procente šuta za dva (76%, 19/25) i tri poena (62,5%, 5/8) u srpskom timu. Sa reprezentacijom je igrao i na Evropskom prvenstvu 2015. gde je osvojeno četvrto mesto. Naredne 2016. godine je bio deo sastava koji je osvojio srebrnu medalju na Olimpijskim igrama u Riju. Zbog povrede je propustio Evropsko prvenstvo 2017. Odlukom selektora Đorđevića nije se našao na konačnom spisku igrača za Svetsko prvenstvo 2019. u Kini."]
    ]
    
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerAge: UILabel!
    @IBOutlet var playerHeight: UILabel!
    @IBOutlet var playerDescription: UITextView!
    @IBOutlet var namedAge: UILabel!
    @IBOutlet var namedHeight: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setPlayerInfoToView()
        makeRadiusOnLabel(radius: 18, [playerAge,playerHeight, namedAge, namedHeight], nil)
        makeRadiusOnLabel(radius: 25, nil, playerDescription)
    }
    
    func setPlayerInfoToView(){
        playerImage.image = UIImage(named: player.image2)
        playerAge.text = String(player.age)
        playerHeight.text = String(player.height)
        
        for (index,info) in playerInfo.enumerated(){
            if info[0] == player.surname{
                playerDescription.text = String(playerInfo[index][1])
            }
        }
    }
    
    func makeRadiusOnLabel(radius: CGFloat, _ labels: [UILabel]?, _ textView: UITextView?) {
       
        if let array = labels{
            for label in array{
                label.layer.cornerRadius = radius
                label.layer.masksToBounds = true
            }
        }
        
        if let textViewToSet = textView {
            textViewToSet.layer.cornerRadius = radius
            textViewToSet.layer.masksToBounds = true
        }
    }
    

}
