//
//  TestData.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 7.7.21..
//

import Foundation

class TestData{
    
    //MARK: Decode data from JSON, and prepare lists for display
    static func populateTestData(){
        
        FetchedData.publicEventiList = []
        
        //MARK: 1. Public Event list
        let publicEventString = publicEventJSON.data(using: .utf8)
        if let data = publicEventString, let events = try? JSONDecoder().decode([PublicEvent].self, from: data) {
                FetchedData.publicEventiList = events
        }
        
        //MARK: 2. Premium Event list
        let premiumEventString = premiumEventJSON.data(using: .utf8)
        if let data = premiumEventString, let events = try? JSONDecoder().decode(PremiumEventResponse.self, from: data) {
            FetchedData.premiumEventiList = events.data
        }
        
        //MARK: 3. Food Experience list
        let foodExperienceString = foodExperienceJSON.data(using: .utf8)
        if let data = foodExperienceString, let foodExperience = try? JSONDecoder().decode(FoodExperienceResponse.self, from: data) {
            FetchedData.foodExperienceList = foodExperience.data
        }
        
        //MARK: 4. Places and Territory
        let placesAndTerritoryString = placesAndTerritoryJSON.data(using: .utf8)
        if let data = placesAndTerritoryString, let placesAndTerritory = try? JSONDecoder().decode(PlacesAndTerritoryResponse.self, from: data) {
            FetchedData.placesAndTerritory = placesAndTerritory.data
        }
        
        //MARK: 5. Contact and Info list
        let contactAndInfoString = contactAndInfoJSON.data(using: .utf8)
        if let data = contactAndInfoString, let contactAndInfo = try? JSONDecoder().decode(ContactAndInfoResponse.self, from: data) {
            FetchedData.contactAndInfoList = contactAndInfo.data
        }
        
        //MARK: 6. Drive Experience
        let driveExperienceString = driveExperienceJSON.data(using: .utf8)
        if let data = driveExperienceString, let driveExperience = try? JSONDecoder().decode(AudiDriveExperienceResponse.self, from: data){
            FetchedData.driveExperience = driveExperience.data
        }
        
        //MARK: 7. Survery response list
            //4.Survey Response
        let surveyResponse = surveyResponseJSON.data(using: .utf8)
        if let data = surveyResponse, let result = try? JSONDecoder().decode(SurveyResponse.self, from: data) {
            FetchedData.surveyList = result.questions
        }

        //MARK: 8. Notification list
        let notificationsString = notificationsJSON.data(using: .utf8)
        if let data = notificationsString, let notifications = try? JSONDecoder().decode([Notifications].self, from: data){
            FetchedData.notificationsList = notifications
        }
        
    }

}

let notificationsJSON = """
[{
        "status": "Sent",
        "statusCode": "sent",
        "sentTime": "2021-01-29T16:31:07+0100",
        "title": "Sent by confi",
        "topic": "3470200e-b987-469c-a8e7-0d4ed4e02a56",
        "deepLink": "/generic",
        "body": "One notifies amandate da config"
    },
{
        "status": "Sent",
        "statusCode": "sent",
        "sentTime": "2021-01-29T16:31:07+0100",
        "title": "Sent by confi",
        "topic": "3470200e-b987-469c-a8e7-0d4ed4e02a56",
        "deepLink": "/generic",
        "body": "One notifies amandate da config"
    },
{
        "status": "Sent",
        "statusCode": "sent",
        "sentTime": "2021-01-29T16:39:07+0100",
        "title": "Sent by confi 2",
        "topic": "3470200e-b987-469c-a8e7-0d4ed4e02a56",
        "deepLink": "/generic",
        "body": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    },
    {
        "status": "Sent",
        "statusCode": "sent",
        "sentTime": "2021-01-29T15:54:02+0100",
        "title": "Last Save Not Yet Saved",
        "topic": "3470200e-b987-469c-a8e7-0d4ed4e02a56",
        "deepLink": "/survey",
        "body": "Briefly describe the changes you made."
    }
]
"""

let surveyResponseJSON = """
        {
              "questions": [{
                    "surveyId": "1",
                    "title": "Random title",
                    "questionId": "1",
                    "required": "Required",
                    "requiredError": "Required Error",
                    "webformMultiple": "Web Form",
                    "type": "Type"
                        }],
              "status": "Accepted",
              "result": "200",
              "resultCode": "200",
              "resultMessage": "OK"
        }
    """

let driveExperienceJSON = """
    {

        "data": {
            "id": "1",

            "description": "È universalmente riconosciuto che un lettore che osserva il layout di una pagina viene distratto dal contenuto testuale se questo è leggibile. Lo scopo dell’utilizzo del Lorem Ipsum è che offre una normale distribuzione delle lettere (al contrario di quanto avviene se si utilizzano brevi frasi ripetute, ad esempio “testo qui”), apparendo come un normale blocco di testo leggibile. Molti software di impaginazione e di web design utilizzano Lorem",

            "subtitleAde": "Al contrario di quanto si pensi, Lorem Ipsum ",

            "titleAde": "Audi driving Experience",

            "sliderImage": [{
                    "id": "1",
                    "href": "https://www.wearecentralpa.com/wp-content/uploads/sites/69/2021/01/AdobeStock_133146697.jpeg?w=2560&h=1440&crop=1",
                    "meta": {
                        "alt": "loading..",
                        "title": "Meta",
                        "width": 200,
                        "height": 300
                    }
                }, {
                    "id": "2",
                    "href": "https://c4.wallpaperflare.com/wallpaper/675/310/349/audi-rs6-audi-rs6-avant-quattro-wallpaper-preview.jpg",
                    "meta": {
                        "alt": "loading..",
                        "title": "Meta",
                        "width": 200,
                        "height": 300
                    }
                }, {
                    "id": "3",
                    "href": "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/18_audi_a4_e-tron_rs_render_2021.jpg?itok=vouYnOJ0",
                    "meta": {
                        "alt": "loading..",
                        "title": "Meta",
                        "width": 200,
                        "height": 300
                    }
                }, {
                    "id": "4",
                    "href": "https://audiclubserbia.com/club/wp-content/uploads/2021/02/1-audi-e-tron-s-sportback-2021-uk-first-drive-review-hero-front-450x290@2x.jpg",
                    "meta": {
                        "alt": "loading..",
                        "title": "Meta",
                        "width": 200,
                        "height": 300
                    }
                },
                {
                    "id": "5",
                    "href": "https://c4.wallpaperflare.com/wallpaper/675/310/349/audi-rs6-audi-rs6-avant-quattro-wallpaper-preview.jpg",
                    "meta": {
                        "alt": "loading..",
                        "title": "Meta",
                        "width": 200,
                        "height": 300
                    }
                }

            ],

            "imageAde": {
                "id": "2",
                "href": "https://topspeed.rs/gallery/thumb/foto-audi-1/page/1/marker/30868/photo/167060.jpeg",
                "meta": {
                    "alt": "loading..",
                    "title": "Meta",
                    "width": 200,
                    "height": 300
                }
            }


        },
        "result": "200",
        "resultCode": "200",
        "resultMessage": "OK"
    }
"""

let contactAndInfoJSON = """
           {
               "data": [{
                   "id": "1",
                   "title": "Some random Title",
                   "contactImage": {
                       "id": "2",
                       "href": "https://topspeed.rs/gallery/thumb/foto-audi-1/page/1/marker/30868/photo/167060.jpeg",
                       "meta": {
                           "alt": "loading..",
                           "title": "Meta",
                           "width": 200,
                           "height": 300
                       }
                   }
               }],
               "result": "200",
               "resultCode": "200",
               "resultMessage": "OK"

           }
"""

let placesAndTerritoryJSON = """
{
    "data": {
        "id": "1",
        "title": "Uno Due Tre Divergenti",
        "description": "Suspendisse auctor at nulla a ultrices. Suspendisse accumsan diam vitae eleifend blandit. Praesent a augue faucibus, feugiat diam ac, semper elit. Suspendisse et semper quam, quis euismod tortor. Integer congue ut risus id interdum. Fusce dapibus metus nec augue porta, blandit scelerisque sem sagittis. Maecenas interdum turpis vitae tortor euismod efficitur vitae sed massa.",
        "placeSubtitle": "Cognos",
        "placeTitle": "Nepal",
        "placesSlider": [
            {
                "id": "1",
                "href": "https://thegotofamily.com/wp-content/uploads/2021/05/20GorgeousSidetownsinItaly__HERO_shutterstock_688078159.jpg",
                "meta": {
                    "alt": "loading..",
                    "title": "Meta",
                    "width": 200,
                    "height": 300
                }
            },
            {
                "id": "2",
                "href": "https://balkangreenenergynews.com/wp-content/uploads/2020/06/Italy-enables-homeowners-to-install-PV-systems-for-free.jpg",
                "meta": {
                    "alt": "loading..",
                    "title": "Meta",
                    "width": 200,
                    "height": 300
                }
            },
            {
                "id": "3",
                "href": "https://scx2.b-cdn.net/gfx/news/2020/3-italy.jpg",
                "meta": {
                    "alt": "loading..",
                    "title": "Meta",
                    "width": 200,
                    "height": 300
            }
        }],
        "imagePlace": {
            "id": "1",
            "href": "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/18_audi_a4_e-tron_rs_render_2021.jpg?itok=vouYnOJ0",
            "meta": {
                "alt": "loading..",
                "title": "Meta",
                "width": 200,
                "height": 300
            }
        }
    },
    "result": "200",
    "resultCode": "200",
    "resultMessage": "OK"
}
"""

let foodExperienceJSON = """
     {
         "data": [{
             "id": "1",
             "title": "TITLE1",
             "header": "this is a header",
             "subtitle": {
                 "value": "String",
                 "format": "",
                 "processed": ""
             },
             "foodImage": {
                 "id": "1",
                 "href": "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/18_audi_a4_e-tron_rs_render_2021.jpg?itok=vouYnOJ0",
                 "meta": {
                     "alt": "loading..",
                     "title": "Meta",
                     "width": 200,
                     "height": 300
                 }
             },
             "programExperience": [
                 {
                     "day": "11.01.2021.",
                     "start": "08:00",
                     "type": "",
                     "activity": "brekfast",
                     "site": "",
                     "description": "",
                     "food": "",
                     "allergens": ""
                 },
                 {
                     "day": "21.02.2021.",
                     "start": "",
                     "type": "",
                     "activity": "",
                     "site": "",
                     "description": "",
                     "food": "",
                     "allergens": ""
                 }
             ]
         }],
         "result": "200",
         "resultCode": "200",
         "resultMessage": "OK"
     }
    """


let premiumEventJSON = """
    {
        "data": [{
            "id": "1",
            "title": "Uomini fiesta del Audi",
            "description": {
                "value": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                "format": "nn",
                "processed": "Y"
            },
            "headerPremium": "Bene bene",
            "linkMyAudiPremium": {
                "uri": "www.audi.de",
                "title": "Audi",
                "options": []
            },
            "noteProgram": {
                "value": "Culinigo umelana",
                "format": "Som",
                "processed": "Uno"
            },
            "programDetails": [{
                "day": "1",
                "activities": [{
                    "start": "16:30",
                    "end": "20:30",
                    "activity": "Survey disponibile"
                }]
            }],
            "subtitle": "Madona di Camiglio",
            "image": {
                "id": "1",
                "href": "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/18_audi_a4_e-tron_rs_render_2021.jpg?itok=vouYnOJ0",
                "meta": {
                    "alt": "loading..",
                    "title": "Meta",
                    "width": 200,
                    "height": 300
                }
            }
        },
                {
                    "id": "2",
                    "title": "Uomini fiesta del Audi",
                    "description": {
                        "value": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                        "format": "nn",
                        "processed": "Y"
                    },
                    "headerPremium": "Bene bene",
                    "linkMyAudiPremium": {
                        "uri": "www.audi.de",
                        "title": "Audi",
                        "options": []
                    },
                    "noteProgram": {
                        "value": "Culinigo umelana",
                        "format": "Som",
                        "processed": "Uno"
                    },
                    "programDetails": [{
                        "day": "1",
                        "activities": [{
                            "start": "16:30",
                            "end": "20:30",
                            "activity": "Survey disponibile"
                        }]
                    }],
                    "subtitle": "Madona di Camiglio",
                    "image": {
                        "id": "1",
                        "href": "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/18_audi_a4_e-tron_rs_render_2021.jpg?itok=vouYnOJ0",
                        "meta": {
                            "alt": "loading..",
                            "title": "Meta",
                            "width": 200,
                            "height": 300
                        }
                    }
                }],
        "result": "200",
        "resultCode": "200",
        "resultMessage": "OK"
    }
    """


let publicEventJSON = """
[{
    "id": "1",
    "title": "Audi Talks Performance: ieri, oggi, e domani.",
    "description": {
        "format": "",
        "value": "Otto puntate con ospiti d'eccezione per condividare visioni all'avangurdia e discutere di una nouva, straordinaria idea"

    },
    "dataEvent": "02.09.2021",
    "linkMyAudi": {
        "uri": "www.audi.de",
        "title": "Audi",
        "options": []

    },
    "priority": 4,
    "status": "OK",
    "backgroundImage": {
        "id": "1",
        "href": "https://cdn-rs.audi.at/media/ThreeColTeaser_TextImage_Image_Component/12754-paragraphs-75119-51281-image/dh-925-bc764f/ae4a3c6b/1622795799/1920x1080-exterior-aq7-191010-oe.jpg",
        "meta": {
            "alt": "loading..",
            "title": "Meta",
            "width": 200,
            "height": 300
        }
    }
}, {
    "id": "2",
    "title": "Cortina e-portrait",
    "description": {
        "format": "",
        "value": "Dal 2017 Audi - per tutilare Cortina come patrimonio si e fatta promotrice con il Comune di Ampezzo di un progetto di Corporate..."

    },
    "dataEvent": "03.09.2021",
    "linkMyAudi": {
        "uri": "www.audi.de",
        "title": "Audi",
        "options": []

    },
    "priority": 1,
    "status": "OK",
    "backgroundImage": {
        "id": "2",
        "href": "https://audimediacenter-a.akamaihd.net/system/production/media/100507/images/34f86323badc5d81b917632c2d53060d83cc0383/A212282_x500.jpg?1618561779",
        "meta": {
            "alt": "loading..",
            "title": "Meta",
            "width": 200,
            "height": 300
        }
    }
},{
    "id": "3",
    "title": "Mountaineering Workshop con Herve ...",
    "description": {
        "format": "",
        "value": "Un evento dedicato alla montagna e al guisto approccio per viverla con rispetto e inteligenza, dalla attivita sportive come lo sci ..."

    },
    "dataEvent": "03.09.2021",
    "linkMyAudi": {
        "uri": "www.audi.de",
        "title": "Audi",
        "options": []

    },
    "priority": 2,
    "status": "OK",
    "backgroundImage": {
        "id": "2",
        "href": "https://cdn-rs.audi.at/media/Theme_Menu_Model_Dropdown_Item_Image_Component/root-rs-model-modelMenu-editableItems-13719-dropdown-314510-image/dh-478-a0e9a6/9134d247/1622795873/1920x1920-audi-q5-sportback-my2021-1342-big-oe.jpg",
        "meta": {
            "alt": "loading..",
            "title": "Meta",
            "width": 200,
            "height": 300
        }
    }
},{
    "id": "4",
    "title": "Performance Workshop con Kristian Ghedina",
    "description": {
        "format": "",
        "value": "I pluricampioni Kristian Ghedina e Peter Fill, insieme agli chef stellati Costardi Bros, ti guideranno in un 'esperienza totale, tra sport."

    },
    "dataEvent": "03.09.2021",
    "linkMyAudi": {
        "uri": "www.audi.de",
        "title": "Audi",
        "options": []

    },
    "priority": 3,
    "status": "OK",
    "backgroundImage": {
        "id": "2",
        "href": "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/images/car-reviews/first-drives/legacy/18_audi_a4_e-tron_rs_render_2021.jpg?itok=vouYnOJ0",
        "meta": {
            "alt": "loading..",
            "title": "Meta",
            "width": 200,
            "height": 300
        }
    }
}

]
"""

