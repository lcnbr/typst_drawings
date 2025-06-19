#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture

#set page(height: auto,width: auto,margin: 5mm)
#set text(size: 13pt)


// #let angled_flag(puncture,angle,radius,label:[],flip:false,stroke:1pt+black,size:0.16,padding:2mm)={

//    flag(puncture,(rel:(angle,radius),to:puncture),stroke,size:size)
//     cetz.draw.content((rel:(angle,radius+padding),to:puncture),label,angle:if flip{angle+180deg }else{angle},anchor:if flip{"east"}else{"west"})
        
// }

#let node_style = (fill:black,radius:1mm,outset:-0.4mm)
#let node_style_mom=(fill:black,radius:0mm)

#let dtnodes ={
  let center = (0,0)
  let rad = 1
  node((rel: (0deg,rad),to: center),"",name:<IN>,..node_style)
  node((rel: (-20deg,1.2*rad),to: center),"",name:<INM>,..node_style_mom)
  
  node((rel: (0deg,0.8*rad),to: center),"",name:<INS>,..node_style_mom)
  
  node((rel: (20deg,1.2*rad),to: center),"",name:<INW>,..node_style_mom)
  
  node((rel: (-90deg,rad),to: center),"",name:<IE>,..node_style)
  node((rel: (-90deg,0.8*rad),to: center),"",name:<IES>,..node_style_mom,outset:0mm)
  node((rel: (-90deg,1.2*rad),to: center),"",name:<IEN>,..node_style_mom,outset:0mm)
  node((rel: (-70deg,1.2*rad),to: center),"",name:<IEM>,..node_style_mom)
  
  node((rel: (180deg,rad),to: center),"",name:<IW>,..node_style)
  node((rel: (180deg,1.2*rad),to: center),"",name:<IWE>,..node_style_mom)
  
  node((rel: (160deg,1.2*rad),to: center),"",name:<IWS>,..node_style_mom)
  node((rel: (180deg,0.8*rad),to: center),"",name:<IWW>,..node_style_mom)
  node((rel: (90deg,rad),to: center),"",name:<IS>,..node_style)
  
  node((rel: (110deg,1.2*rad),to: center),"",name:<ISS>,..node_style_mom)
  
  node((rel: (70deg,1.2*rad),to: center),"",name:<ISW>,..node_style_mom)
  node((rel: (90deg,0.7*rad),to: center),"",name:<ISM>,..node_style_mom)
  // hide(node((rel: (0,-2*rad),to: center),"",name:<ON>,..node_style))
  
  node((rel: (-10deg,2.4*rad),to: center),"",name:<OEP>,..node_style_mom,outset:0mm)
  node((rel: (-90deg,1.8*rad),to: center),"",name:<OES>,..node_style_mom,outset:0mm)
  node((rel: (-90deg,2*rad),to: center),"",name:<OE>,..node_style)
  node((rel: (80deg,2.4*rad),to: center),"",name:<OWP>,..node_style_mom,outset:0mm)
  node((rel: (180deg,2*rad),to: center),"",name:<OW>,..node_style)
  
  
  node((rel: (180deg,1.8*rad),to: center),"",name:<OWPhoton>,..node_style_mom)
  node((rel: (-120deg,2.2*rad),to: center),"",name:<OEM>,..node_style_mom,outset:0mm)
  node((rel: (210deg,2.2*rad),to: center),"",name:<OWM>,..node_style_mom,outset:0mm)
  // node((rel: (0,2*rad),to: center),"",name:<OS>,..style)
 }

 
 #let electron =(stroke:purple.darken(20%)+0.5mm,marks:((inherit:"|>",pos:0.5,scale:60%),))
 
 #let quark =(stroke:black+0.5mm,marks:((inherit:"|>",pos:0.5,scale:60%),))
 
 #let mom_arr =(stroke:black+1.1pt,marks:((inherit:">",pos:1,scale:40%),))
 #let mom_arr =(stroke:black+1.1pt,marks:((inherit:">",pos:1,scale:40%),))
#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:42deg,..electron),
 (vertices:(<OWM>,<OEM>),bend:22deg,..mom_arr),
 
 (vertices:(<OE>,<OW>),bend:134deg,..electron),
 (vertices:(<OEP>,<OWP>),bend:43deg,..mom_arr),
 
 (vertices:(<IE>,<OE>),decorations:"wave"),
 (vertices:(<IEN>,<OES>),..mom_arr,shift:2.3mm),
 (vertices:(<IW>,<OW>),decorations:"wave"),
 (vertices:(<IWE>,<OWPhoton>),..mom_arr,shift:-2.3mm),
 
 (vertices:(<IN>,<IE>),bend:-43deg,..quark),
 (vertices:(<INM>,<IEM>),bend:-33deg,..mom_arr),
 
 (vertices:(<IE>,<IS>),bend:0deg,..quark),
 
 (vertices:(<IES>,<ISM>),bend:0deg,..mom_arr,shift:-2mm),
 (vertices:(<IW>,<IN>),bend:0deg,crossing:true,..quark),
 
 (vertices:(<IWW>,<INS>),bend:0deg,crossing:true,..mom_arr,shift:2mm),
 (vertices:(<IS>,<IW>),bend:43deg,..quark),
 
 (vertices:(<ISS>,<IWS>),bend:33deg,..mom_arr),
 (vertices:(<IN>,<IS>),bend:43deg,decorations:"coil"),
 
 (vertices:(<INW>,<ISW>),bend:33deg,..mom_arr),
 
  )

 
#box(diagram(
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
       
        let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        let tstroke = stroke
        tstroke.paint=blue.lighten(50%)
        let dstroke = tstroke
        dstroke.dash = "dotted"
        let r1p = (2.1*space,1.34*spacey)
        // angled_flag(r1p,-45deg,3.5*space,stroke:tstroke,label:[$r_2+t_1-t_2+t_3$])
        // angled_flag(r1p,45deg,3.5*space,stroke:tstroke,label:[$r_2+t_1-t_2$])
        // angled_flag(r1p,145deg,3.*space,stroke:tstroke,label:[$r_2-t_2$],flip:true)
        // flag(r1p,(rel:(-20deg,1.4)),(rel:(40deg,1.2)),(rel:(0deg,1.2)),dstroke,size:0.16)
        // angled_flag(r1p,-145deg,3.*space,stroke:stroke,label:[$r_2$],flip:true)
        // cetz.draw.content((6.1*space,1.6*spacey),[$r_2+t_1-t_2-t_4$],anchor:"center",angle:80deg)

        // stroke.paint = red
        // tstroke.paint = red.lighten(50%)
        // let r2p = (3.2*space,1.34*spacey)
        
        // angled_flag(r2p,-35deg,2.6*space,stroke:tstroke,label:[$r_2+t_3+t_1$])
        // angled_flag(r2p,35deg,2.4*space,stroke:tstroke,label:[$r_2+t_1$])
        // // angled_flag(r2p,-135deg,3.6*space,stroke:tstroke,label:[$r_2+t_2$],flip:true)

        
        
        // angled_flag(r2p,135deg,3.6*space,stroke:stroke,label:[$r_2$],flip:true)
        
    })
  }

),baseline: -0.5cm)

