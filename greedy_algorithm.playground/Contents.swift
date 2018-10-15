import Foundation

class DeliveryMan {
    var deliverys = [Delivery]()
    var lastUse = 0
    init(delivery: Delivery, lastUse: Int) {
        self.deliverys.append(delivery)
        self.lastUse = lastUse
    }
}

class Delivery {
    var start = 0
    var duration = 0
    init(start: Int, duration: Int) {
        self.start = start
        self.duration = duration
    }
}

var dms = [DeliveryMan]()
var dvs = [Delivery]()

func addDelivery(start: Int, duration: Int) {
    let dv = Delivery(start: start, duration: duration)

    var i = 0
    var flag = false
    while i<dms.count {
        if(dms[i].lastUse<=dv.start) {
            dms[i].deliverys.append(dv)
            dms[i].lastUse = dv.start + dv.duration
            flag = true
            break
        }
        i += 1
    }
    if(!flag) {
        let dm = DeliveryMan(delivery: dv, lastUse: dv.start + dv.duration)
        dms.append(dm)
    }
}

func plusDv(start: Int, duration: Int) {
    dms.removeAll()
    
    var dv = Delivery(start: 0, duration: 0)
    let dm = DeliveryMan(delivery: dv, lastUse: dv.start + dv.duration)
    
    dms.append(dm)

    dv = Delivery(start: start, duration: duration)
    dvs.append(dv)

    let sorted_dvs = dvs.sorted { $0.start < $1.start }
    var aux = 0
    while aux<sorted_dvs.count {
        addDelivery(start: sorted_dvs[aux].start, duration: sorted_dvs[aux].duration)
        aux += 1
    }
}

plusDv(start: 0, duration: 3)
plusDv(start: 0, duration: 3)
plusDv(start: 0, duration: 7)
plusDv(start: 4, duration: 3)
plusDv(start: 4, duration: 6)
plusDv(start: 8, duration: 3)
plusDv(start: 8, duration: 3)
plusDv(start: 10, duration: 5)
plusDv(start: 12, duration: 3)
plusDv(start: 12, duration: 3)

print("Número de motoboys:")
print(dms.count)
