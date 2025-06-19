#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag
#import "../edge_style.typ":electron,photon,quark,gluon 

#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)

#let dtnodes(..style) ={
  let center = (0,0)
  let rad = 1
  node((rel: (240deg,rad),to: center),"",name:<IN1>,..style)
  node((rel: (300deg,rad),to: center),"",name:<IN2>,..style)
  node((rel: (0deg,rad),to: center),"",name:<IE>,..style)
  node((rel: (180deg,rad),to: center),"",name:<IW>,..style)
  // node((rel: (90deg,rad),to: center),"",name:<IS>,..style)
  // hide(node((rel: (0,-2*rad),to: center),"",name:<ON>,..style))
  node((rel: (0deg,2*rad),to: center),"",name:<OE>,..style)
  node((rel: (180deg,2*rad),to: center),"",name:<OW>,..style)
  // node((rel: (0,2*rad),to: center),"",name:<OS>,..style)
 }

#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:88deg,..electron),
 (vertices:(<OE>,<OW>),bend:88deg,..electron),
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN2>,<IE>),bend:23deg,..quark),
 (vertices:(<IE>,<IW>),bend:88deg,..quark),
 (vertices:(<IW>,<IN1>),bend:23deg,..quark),
 (vertices:(<IN1>,<IN2>),bend:23deg,..quark),
 (vertices:(<IN1>,<IN2>),bend:-77deg,..quark),
 
 // (vertices:(<IS>,<IW>),bend:43deg,..quark),
 // (vertices:(<IN>,<IS>),..gluon),
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