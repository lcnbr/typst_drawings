#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture

#import "../edge_style.typ": photon,gluon,quark,electron,initial,final
#set page(height: auto,width: auto,margin: 5mm)
#set text(size: 13pt)

// #let angled_flag(puncture,angle,radius,label:[],flip:false,stroke:1pt+black,size:0.16,padding:2mm)={

//    flag(puncture,(rel:(angle,radius),to:puncture),stroke,size:size)
//     cetz.draw.content((rel:(angle,radius+padding),to:puncture),label,angle:if flip{angle+180deg }else{angle},anchor:if flip{"east"}else{"west"})
        
// }

#let node_style = (fill:black,radius:1mm)
#let node_style_mom=(fill:black,radius:0mm)

#let dtnodes ={
  let center = (0,0)
  let rad = 1
  node((rel: (0deg,rad),to: center),"",name:<IN>,..node_style)
  node((rel: (-90deg,rad),to: center),"",name:<IE>,..node_style)
  
  node((rel: (180deg,rad),to: center),"",name:<IW>,..node_style)
  node((rel: (90deg,rad),to: center),"",name:<IS>,..node_style)
  
 node((rel: (-90deg,2*rad),to: center),"",name:<OE>,..node_style)
 
  node((rel: (180deg,2*rad),to: center),"",name:<OW>,..node_style)
  
  
}

#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:42deg,..electron),
 // (vertices:(<OWM>,<OEM>),bend:22deg,..mom_arr),
 
 (vertices:(<OE>,<OW>),bend:132.5deg,..electron),
 // (vertices:(<OEP>,<OWP>),bend:43deg,..mom_arr),
 
 (vertices:(<IE>,<OE>),..photon),
 // (vertices:(<IEN>,<OES>),..mom_arr,shift:2.3mm),
 (vertices:(<IW>,<OW>),..photon),
 // (vertices:(<IWE>,<OWPhoton>),..mom_arr,shift:-2.3mm),
 
 (vertices:(<IN>,<IE>),bend:-43deg,..quark),
 // (vertices:(<INM>,<IEM>),bend:-33deg,..mom_arr),
 
 (vertices:(<IE>,<IS>),bend:0deg,..quark),
 
 // (vertices:(<IES>,<ISM>),bend:0deg,..mom_arr,shift:-2mm),
 (vertices:(<IW>,<IN>),bend:0deg,crossing:true,..quark),
 
 // (vertices:(<IWW>,<INS>),bend:0deg,crossing:true,..mom_arr,shift:2mm),
 (vertices:(<IS>,<IW>),bend:43deg,..quark),
 
 // (vertices:(<ISS>,<IWS>),bend:33deg,..mom_arr),
 (vertices:(<IN>,<IS>),bend:43deg,..gluon),
 // 
 // (vertices:(<INW>,<ISW>),bend:33deg,..mom_arr),
 
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
       
      
        let r1p = (3.1*space,.8*spacey)
        angled_flag(r1p,141deg,3.7*space,stroke:final,label:[])
        angled_flag(r1p,-171deg,3.4*space,stroke:initial,label:[])
        
    })
  }

)

