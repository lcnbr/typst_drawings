#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture

#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)
#let edgestyle = (label-side:center,label-pos:0.5,label-wrapper: e =>
circle(e.label, fill: e.label-fill,inset: 0mm,stroke: black))
#let dtedges2 =  (
 (vertices:(<OW>,<OE>),bend:88deg,stroke:purple.darken(20%),..edgestyle,label:[#h(0.5mm)3]),
 (vertices:(<OE>,<OW>),bend:88deg,stroke:purple.darken(20%),..edgestyle,label:[#h(0.5mm)3]),
 (vertices:(<IE>,<OE>),stroke:(dash:(0.42pt,3pt)),..edgestyle,label:[#h(0.5mm)0]),
 (vertices:(<IW>,<OW>),stroke:(dash:(0.42pt,3pt)),..edgestyle,label:[#h(0.5mm)0]),
 (vertices:(<IN>,<IE>),bend:43deg,..edgestyle,label:[#h(0.5mm)1]),
 (vertices:(<IE>,<IS>),bend:43deg,..edgestyle,label:[#h(0.5mm)1]),
 (vertices:(<IW>,<IN>),bend:43deg,..edgestyle,label:[#h(0.5mm)4]),
 (vertices:(<IS>,<IW>),bend:43deg,..edgestyle,label:[#h(0.5mm)4]),
 (vertices:(<IN>,<IS>),..edgestyle,label:[#h(0.5mm)3]),
  )
#box(diagram(
  node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
  dtnodes(fill:black,radius:1mm),
  for (eid,e) in dtedges2.enumerate(){ 
      edge(..e)
  },
  render: (grid, nodes, edges, options) => {
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
        puncture((1.8,1.24),radius:0.16,stroke:1.5pt+blue)    
    })
  }
),baseline: 0mm)