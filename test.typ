#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#place(rect(width: 10cm, height: 8cm))


#let c = cetz.canvas(
  {
    cetz.draw.rect((0,0),(3,0))
    cetz.draw.hobby((9,-1),(1,2),(2,2),(3,3))
    // cetz.draw.set-origin((1,2))
  }
)

#place(c)