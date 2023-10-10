
import Foundation

struct Contact: Codable{
    var name: String?
    var email: String?
    var phone: String?
    
    init(name: String? = nil, email: String? = nil, phone: String? = nil) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}

var contacts: [Contact] = [
    Contact(name: "Simon", email: "simon.villarreal.test@walgreens.com", phone: "(469) 555-0146"),
    Contact(name: "Carter", email: "carter.matthews.test@united.com", phone: "(218) 555-0121"),
    Contact(name: "Rodriquez", email: "everleigh.rodriquez.test@facebook.com", phone: "(605) 555-0160"),
    Contact(name: "Everly", email: "everly.pack.test@ge.com", phone: "(865) 555-0186"),
    Contact(name: "Edgar", email: "edgar.galloway.test@deere.com", phone: "(904) 555-0190"),
    Contact(name: "Arthur", email: "arthur.crowley.test@berkshirehathaway.com", phone: "(281) 555-0128"),
    Contact(name: "Lance", email: "lance.pagan.test@wellsfargo.com", phone: "(410) 555-0140"),
    Contact(name: "Annika", email: "annika.milligan.test@instagram.com", phone: "(711) 555-0171"),
    Contact(name: "Hari", phone: "(911) 554-0181")
]

