import Foundation

class Partition {
    var parts = [Part]()
    var lastUse = 0
    init(part: Part, lastUse: Int) {
        self.parts.append(part)
        self.lastUse = lastUse
    }
}

class Part {
    var name = ""
    var start = 0
    var duration = 0
    init(name: String, start: Int, duration: Int) {
        self.start = start
        self.duration = duration
        self.name = name
    }
}

var pts = [Partition]()
var ps = [Part]()

func insertPart(name: String, start: Int, duration: Int) {
    let dv = Part(name: name, start: start, duration: duration)
    
    var i = 0
    var flag = false
    while i<pts.count {
        if(pts[i].lastUse<=dv.start) {
            pts[i].parts.append(dv)
            pts[i].lastUse = dv.start + dv.duration
            flag = true
            break
        }
        i += 1
    }
    if(!flag) {
        let dm = Partition(part: dv, lastUse: dv.start + dv.duration)
        pts.append(dm)
    }
}

func addPart(name: String, start: Int, duration: Int) {
    pts.removeAll()
    
    var dv = Part(name: name, start: 0, duration: 0)
    let dm = Partition(part: dv, lastUse: dv.start + dv.duration)
    
    pts.append(dm)
    
    dv = Part(name: name, start: start, duration: duration)
    ps.append(dv)
    
    let sorted_ps = ps.sorted { $0.start < $1.start }
    var aux = 0
    while aux<sorted_ps.count {
        insertPart(name: sorted_ps[aux].name, start: sorted_ps[aux].start, duration: sorted_ps[aux].duration)
        aux += 1
    }
}

addPart(name: "Estrutura de dados 2", start: 0, duration: 3)
addPart(name: "Requisitos de software", start: 0, duration: 3)
addPart(name: "Introdução a engenharia", start: 0, duration: 7)
addPart(name: "Cálculo 2", start: 4, duration: 3)
addPart(name: "Introdução a álgebra linear", start: 4, duration: 6)
addPart(name: "Banco de dados", start: 8, duration: 3)
addPart(name: "Introdução a sociologia", start: 8, duration: 3)
addPart(name: "Química geral teórica", start: 10, duration: 5)
addPart(name: "Química geral experimental", start: 12, duration: 3)
addPart(name: "Física 1", start: 12, duration: 3)

print("Number of partitions:")
print(pts.count)

print("-------------------------------------------")
var k = 0
while k<pts.count {
    print("Sala " + String(k + 1))
    var l = 0
    while l<pts[k].parts.count {
        if(k == 0 && l == 0) {
            // nothing
        } else {
            print("\t" + String(pts[k].parts[l].name))
        }
        l += 1
    }
    k += 1
    print("-------------------------------------------")
}
