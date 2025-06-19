#set page(width: 35cm, height: auto)
#import "@preview/cetz:0.3.1"
            #{
let cols = (30%,30%,30%)

let node(pos)=cetz.draw.circle(pos,radius:0.02,fill: black)
let stroke = 0.7pt
let amplitude = 0.051
let arrow-scale = 0.8
let segment-length = 0.0521
let edge(..points,decoration:"",angle:0deg)={
    if decoration == "coil"{
    cetz.decorations.coil(cetz.draw.hobby(..points),amplitude:amplitude,stroke:stroke,align:"MID")
    } else if decoration == "wave" {
        cetz.decorations.wave(cetz.draw.hobby(..points),amplitude:amplitude,stroke:stroke)
    }  else if decoration == "arrow"{
        let points = points.pos()
        if points.len()==2{
          let center = (0.5*(points.at(0).at(0)+points.at(1).at(0)),0.5*(points.at(0).at(1)+points.at(1).at(1)))
          cetz.draw.hobby(..points,stroke:stroke)
          cetz.draw.mark(center,angle,symbol: ">", fill: black,anchor: "center",scale:arrow-scale)
        } else {
          let (first,center,..other)=points
          cetz.draw.hobby(first,center,..other,stroke:stroke)
            cetz.draw.mark(center,angle,symbol: ">", fill: black,anchor: "center",scale:arrow-scale)
        }

    }else {
            cetz.draw.hobby(..points,stroke:stroke)
    }
}
let d00=cetz.canvas(length:50%,{
let node0= (pos:(-0.76, -0.26))
node(node0.pos)
let node1= (pos:(-0.80, 0.30))
node(node1.pos)
let node2= (pos:(0.71, 0.40))
node(node2.pos)
let node3= (pos:(0.75, -0.15))
node(node3.pos)
let node4= (pos:(0.00, -0.30))
node(node4.pos)
let node5= (pos:(-0.05, 0.44))
node(node5.pos)
edge(node1.pos,(-0.70, 0.03),node0.pos,decoration:"arrow",angle:1.65rad)
cetz.draw.content((-0.58, 0.04),angle:1.65rad,[k(0)+k(1)])
cetz.draw.hobby((-0.72, 0.28),(-0.64, 0.03),(-0.68, -0.23),stroke:stroke,mark: (end: ">"))
edge(node0.pos,(-1.00, 0.00),node1.pos,decoration:"arrow",angle:4.79rad)
cetz.draw.content((-1.12, -0.01),angle:4.79rad,[k(0)])
cetz.draw.hobby((-0.86, -0.29),(-1.06, -0.00),(-0.91, 0.31),stroke:stroke,mark: (end: ">"))
edge(node0.pos,(-0.39, -0.37),node4.pos,decoration:"wave",angle:6.23rad)
cetz.draw.content((-0.39, -0.49),angle:6.23rad,[k(1)])
cetz.draw.hobby((-0.72, -0.35),(-0.39, -0.43),(-0.05, -0.38),stroke:stroke,mark: (end: ">"))
edge(node5.pos,(-0.45, 0.46),node1.pos,decoration:"wave",angle:3.33rad)
cetz.draw.content((-0.47, 0.57),angle:3.33rad,[k(1)])
cetz.draw.hobby((-0.12, 0.52),(-0.46, 0.52),(-0.77, 0.39),stroke:stroke,mark: (end: ">"))
edge(node3.pos,(0.95, 0.14),node2.pos,decoration:"arrow",angle:4.79rad)
cetz.draw.content((1.07, 0.15),angle:4.79rad,[k(2)])
cetz.draw.hobby((0.85, -0.17),(1.01, 0.15),(0.81, 0.43),stroke:stroke,mark: (end: ">"))
edge(node2.pos,(0.64, 0.12),node3.pos,decoration:"coil",angle:4.79rad)
cetz.draw.content((0.52, 0.11),angle:4.79rad,[k(2)+k(3)])
cetz.draw.hobby((0.63, 0.38),(0.58, 0.11),(0.67, -0.14),stroke:stroke,mark: (end: ">"))
edge(node5.pos,(0.33, 0.51),node2.pos,decoration:"arrow",angle:-0.05rad)
cetz.draw.content((0.34, 0.63),angle:-0.05rad,[k(3)])
cetz.draw.hobby((0.00, 0.52),(0.33, 0.57),(0.66, 0.49),stroke:stroke,mark: (end: ">"))
edge(node3.pos,(0.40, -0.31),node4.pos,decoration:"arrow",angle:-2.95rad)
cetz.draw.content((0.42, -0.43),angle:-2.95rad,[k(3)])
cetz.draw.hobby((0.72, -0.25),(0.40, -0.37),(0.07, -0.37),stroke:stroke,mark: (end: ">"))
edge(node4.pos,(-0.02, 0.07),node5.pos,decoration:"arrow",angle:1.64rad)
cetz.draw.content((0.09, 0.08),angle:1.64rad,[k(1)+k(3)])
cetz.draw.hobby((0.06, -0.22),(0.04, 0.08),(0.01, 0.37),stroke:stroke,mark: (end: ">"))
})
let d10=cetz.canvas(length:50%,{
let node0= (pos:(-0.36, -0.90))
node(node0.pos)
let node1= (pos:(-0.87, -0.24))
node(node1.pos)
let node2= (pos:(0.89, 0.59))
node(node2.pos)
let node3= (pos:(0.29, 0.13))
node(node3.pos)
let node4= (pos:(0.73, -0.56))
node(node4.pos)
let node5= (pos:(-0.26, 0.73))
node(node5.pos)
edge(node1.pos,(-0.84, -0.74),node0.pos,decoration:"arrow",angle:8.51rad)
cetz.draw.content((-0.94, -0.82),angle:8.51rad,[k(0)+k(1)])
cetz.draw.hobby((-0.97, -0.32),(-0.89, -0.78),(-0.46, -0.97),stroke:stroke,mark: (end: ">"))
edge(node0.pos,(-0.52, -0.49),node1.pos,decoration:"arrow",angle:5.37rad)
cetz.draw.content((-0.43, -0.42),angle:5.37rad,[k(0)])
cetz.draw.hobby((-0.32, -0.80),(-0.48, -0.46),(-0.76, -0.22),stroke:stroke,mark: (end: ">"))
edge(node0.pos,(0.22, -0.85),node4.pos,decoration:"wave",angle:0.30rad)
cetz.draw.content((0.25, -0.96),angle:0.30rad,[k(1)])
cetz.draw.hobby((-0.25, -0.97),(0.24, -0.91),(0.68, -0.68),stroke:stroke,mark: (end: ">"))
edge(node5.pos,(-0.68, 0.31),node1.pos,decoration:"wave",angle:4.16rad)
cetz.draw.content((-0.78, 0.37),angle:4.16rad,[k(1)])
cetz.draw.hobby((-0.39, 0.71),(-0.72, 0.35),(-0.91, -0.11),stroke:stroke,mark: (end: ">"))
edge(node3.pos,(0.61, 0.38),node2.pos,decoration:"coil",angle:0.65rad)
cetz.draw.content((0.54, 0.48),angle:0.65rad,[k(2)])
cetz.draw.hobby((0.32, 0.23),(0.56, 0.41),(0.80, 0.59),stroke:stroke,mark: (end: ">"))
edge(node2.pos,(1.00, -0.01),node4.pos,decoration:"arrow",angle:1.43rad)
cetz.draw.content((1.12, -0.03),angle:1.43rad,[k(2)+k(3)])
cetz.draw.hobby((1.00, 0.50),(1.06, -0.02),(0.86, -0.50),stroke:stroke,mark: (end: ">"))
edge(node5.pos,(0.34, 0.85),node2.pos,decoration:"arrow",angle:3.02rad)
cetz.draw.content((0.35, 0.97),angle:3.02rad,[k(3)])
cetz.draw.hobby((-0.17, 0.84),(0.35, 0.91),(0.83, 0.72),stroke:stroke,mark: (end: ">"))
edge(node4.pos,(0.48, -0.26),node3.pos,decoration:"arrow",angle:5.30rad)
cetz.draw.content((0.38, -0.33),angle:5.30rad,[k(1)+k(2)+k(3)])
cetz.draw.hobby((0.63, -0.54),(0.41, -0.27),(0.26, 0.04),stroke:stroke,mark: (end: ">"))
edge(node3.pos,(-0.04, 0.41),node5.pos,decoration:"arrow",angle:5.44rad)
cetz.draw.content((-0.13, 0.33),angle:5.44rad,[k(1)+k(3)])
cetz.draw.hobby((0.19, 0.13),(-0.07, 0.36),(-0.27, 0.63),stroke:stroke,mark: (end: ">"))
})
[
                            = d0
]
grid(columns: cols,gutter: 20pt,box[#d00 ],)
pagebreak()
[
                            = d1
]
grid(columns: cols,gutter: 20pt,box[#d10 ],)
pagebreak()
}