#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture
#import "../edge_style.typ":photon,gluon,electron, quark 
#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)


#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:88deg,..electron,label:[$a_1$],label-side:right,label-sep:0mm),
 (vertices:(<OE>,<OW>),bend:88deg,..electron,label:[$a_2$],label-side:right,label-sep:.5mm),
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN>,<IE>),bend:43deg,..quark),
 (vertices:(<IE>,<IS>),bend:43deg,..quark),
 (vertices:(<IW>,<IN>),bend:43deg,crossing:true,..quark),
 (vertices:(<IS>,<IW>),bend:43deg,..quark),
 (vertices:(<IN>,<IS>),bend:0deg,..gluon),
)
// #let dtedges =  (
//  (vertices:(<OW>,<OE>),bend:88deg,stroke:purple.darken(20%)),
//  (vertices:(<OE>,<OW>),bend:88deg,stroke:purple.darken(20%)),
//  (vertices:(<IE>,<OE>),stroke:(dash:(0.42pt,3pt))),
//  (vertices:(<IW>,<OW>),stroke:(dash:(0.42pt,3pt))),
//  (vertices:(<IN>,<IE>),bend:43deg),
//  (vertices:(<IE>,<IS>),bend:43deg),
//  (vertices:(<IW>,<IN>),bend:43deg),
//  (vertices:(<IS>,<IW>),bend:43deg),
//  (vertices:(<IN>,<IS>)),
//   )
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
       
        let initial = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        let final = (thickness:options.edge-stroke.thickness,paint:red,cap:"round")
        let r1p = (2.1*space,1.34*spacey)
      
        
        let r2p = (3.2*space,1.34*spacey)
        puncture(r2p,radius:0.14,stroke:initial)
    })
  }

) 