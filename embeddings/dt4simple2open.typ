#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag
#import "../edge_style.typ":electron,quark,gluon,photon ,initial,final

#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)


// #let angled_flag(puncture,angle,radius,label:[],flip:false,stroke:1pt+black,size:0.16,padding:2mm)={

//    flag(puncture,(rel:(angle,radius),to:puncture),stroke,size:size)
//     cetz.draw.content((rel:(angle,radius+padding),to:puncture),label,angle:if flip{angle+180deg }else{angle},anchor:if flip{"east"}else{"west"})
        
// }
#let nodestyle = (fill:black,radius:1mm)

#let dtnodes ={
  let center = (0,0)
  let rad = 6
  let shift =1.5
  let initangle = 240deg
  let finalangle = 300deg
  let diff = finalangle - initangle
  node((rel: (initangle+60%*diff,rad - shift),to: center),"",name:<IN>,..nodestyle)
  node((rel: (initangle+80%*diff,rad - shift),to: center),"",name:<IE>,..nodestyle)
  node((rel: (initangle+40%*diff,rad - shift),to: center),"",name:<IW>,..nodestyle)
  node((rel: (initangle+20%*diff,rad - shift ),to: center),"",name:<IS>,..nodestyle)
  // hide(node((rel: (0,-2*rad),to: center),"",name:<ON>,..nodestyle))
  node((rel: (initangle+80%*diff,rad),to: center),"",name:<OE>,..nodestyle)
  node((rel:(initangle+40%*diff,rad),to:center),name:<OW>,..nodestyle)
  // node((rel: (0,2*rad),to: center),"",name:<OS>,..style)
  
  node((rel: (initangle,rad),to: center),name:<Iel>)
  node((rel: (finalangle,rad),to: center),name:<Oel>)
  node((rel: (initangle,rad -shift),to: center),name:<Iq>)
  node((rel: (finalangle,rad -shift),to: center),name:<Oq>)
 }

#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:10deg,..electron),
 (vertices:(<OE>,<Oel>),bend:10deg,..electron),
 
 (vertices:(<Iel>,<OW>),bend:10deg,..electron),
 
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN>,<IE>),bend:5deg,..quark),
 (vertices:(<IE>,<Oq>),bend:5deg,..quark),
 (vertices:(<Iq>,<IS>),bend:5deg,..quark),
 (vertices:(<IW>,<IN>),bend:5deg,..quark),
 (vertices:(<IS>,<IW>),bend:5deg,..quark),
 (vertices:(<IN>,<IS>),bend:80deg,..gluon),
  )


#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
  dtnodes,
  for (eid,e) in dtedges.enumerate(){ 
      edge(..e,marks:"-",mark-scale:50%)
  },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
       
        let r1p = (6.3*space,0*spacey)
      
        
        let r2p = (2.3*space,0*spacey)
      // flag(r2p,(rel:(90deg,1.4)),(rel:(180deg,1)),(rel:(-104deg,1.2)),(rel:(-160deg,2.6)),tstroke,size:0.16)
      //   cetz.draw.content((-1.1*space,0.8*spacey),[$r_2+t_2$],anchor:"east",angle:-4deg)
        
      // flag(r2p,(rel:(-90deg,1.4)),(rel:(180deg,1)),(rel:(104deg,1.2)),(rel:(160deg,2.6)),dstroke,size:0.16)
      // cetz.draw.content((-1.2*space,2*spacey),[$r_1+t_1+t_3-t_2$],anchor:"center",angle:80deg)
        
        angled_flag(r2p,-241deg,4*space,stroke:initial,label:[])
        angled_flag(r1p,-299deg,4*space,stroke:initial,label:[])
        angled_flag((5*space,0.2*spacey),80deg,4*space,stroke:final,label:[])
        // angled_flag(r2p,-135deg,3.6*space,stroke:tstroke,label:[$r_1+t_2$],flip:true)

        
        
        // angled_flag(r2p,135deg,3.6*space,stroke:stroke,label:[$r_1$],flip:true)
        
    })
  }

) 