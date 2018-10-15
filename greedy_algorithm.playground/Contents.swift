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
    var start = 0
    var duration = 0
    init(start: Int, duration: Int) {
        self.start = start
        self.duration = duration
    }
}

var pts = [Partition]()
var ps = [Part]()

func insertPart(start: Int, duration: Int) {
    let dv = Part(start: start, duration: duration)
    
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

func addPart(start: Int, duration: Int) {
    pts.removeAll()
    
    var dv = Part(start: 0, duration: 0)
    let dm = Partition(part: dv, lastUse: dv.start + dv.duration)
    
    pts.append(dm)
    
    dv = Part(start: start, duration: duration)
    ps.append(dv)
    
    let sorted_ps = ps.sorted { $0.start < $1.start }
    var aux = 0
    while aux<sorted_ps.count {
        insertPart(start: sorted_ps[aux].start, duration: sorted_ps[aux].duration)
        aux += 1
    }
}

addPart(start: 0, duration: 3)
addPart(start: 0, duration: 3)
addPart(start: 0, duration: 7)
addPart(start: 4, duration: 3)
addPart(start: 4, duration: 6)
addPart(start: 8, duration: 3)
addPart(start: 8, duration: 3)
addPart(start: 10, duration: 5)
addPart(start: 12, duration: 3)
addPart(start: 12, duration: 3)

print("Number of partitions:")
print(pts.count)
