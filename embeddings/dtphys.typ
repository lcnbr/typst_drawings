#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag

#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)

#let electron =(stroke:purple.darken(20%)+0.5mm,marks:((inherit:"|>",pos:0.5,scale:60%),))
#let photon =(stroke:(paint:black,),decorations:"wave")
#let quark =(stroke:black+0.5mm,marks:((inherit:"|>",pos:0.5,scale:60%),))
#let gluon =(stroke:black+0.5mm,decorations:"coil")

#let mom_arr =(stroke:black+1.1pt,marks:((inherit:">",pos:1,scale:40%),))

#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:88deg,..electron),
 (vertices:(<OE>,<OW>),bend:88deg,..electron),
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN>,<IE>),bend:43deg,..quark),
 (vertices:(<IE>,<IS>),bend:43deg,..quark),
 (vertices:(<IW>,<IN>),bend:43deg,..quark),
 (vertices:(<IS>,<IW>),bend:43deg,..quark),
 (vertices:(<IN>,<IS>),..gluon),
  )

#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
  dtnodes(fill:black,radius:1mm),
  for (eid,e) in dtedges.enumerate(){ 
      edge(..e)
  },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
     })
  }

) 