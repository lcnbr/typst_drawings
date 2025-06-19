#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture
#import "dt4simple.typ":dtnodes 
#import "../edge_style.typ":electron,photon,gluon,quark 
#set page(height: auto,width: auto,margin: 5mm)
#set text(size: 13pt)


// #let angled_flag(puncture,angle,radius,label:[],flip:false,stroke:1pt+black,size:0.16,padding:2mm)={

//    flag(puncture,(rel:(angle,radius),to:puncture),stroke,size:size)
//     cetz.draw.content((rel:(angle,radius+padding),to:puncture),label,angle:if flip{angle+180deg }else{angle},anchor:if flip{"east"}else{"west"})
        
// }

#let node_style = (fill:black,radius:1mm,outset:-0.4mm)
#let node_style_mom=(fill:black,radius:0mm)


 
#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:42deg,..electron,label:[$a_1$],label-sep:0mm),
 (vertices:(<OE>,<OW>),bend:132.5deg,..electron,label:[$a_2$],label-sep:0mm),
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN>,<IE>),bend:-43deg,..quark),
 (vertices:(<IE>,<IS>),bend:0deg,..quark),
 (vertices:(<IW>,<IN>),bend:0deg,crossing:true,..quark),
 (vertices:(<IS>,<IW>),bend:43deg,..quark),
 (vertices:(<IN>,<IS>),bend:43deg,..gluon),
)

 
#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
  dtnodes,
  for (eid,e) in dtedges.enumerate(){ 
      edge(..e)
  },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
       
        let initial = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        
        let r1p = (3.1*space,.8*spacey)
        puncture(r1p,stroke:initial,radius:0.14)
        
    })
  }

)

