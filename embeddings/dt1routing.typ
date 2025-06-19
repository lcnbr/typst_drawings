#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag
#import "../edge_style.typ":mom_arr 

#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)


// #let angled_flag(puncture,angle,radius,label:[],flip:false,stroke:1pt+black,size:0.16,padding:2mm)={

//    flag(puncture,(rel:(angle,radius),to:puncture),stroke,size:size)
//     cetz.draw.content((rel:(angle,radius+padding),to:puncture),label,angle:if flip{angle+180deg }else{angle},anchor:if flip{"east"}else{"west"})
        
// }

#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
  dtnodes(fill:black,radius:1mm),
  
  for (eid,e) in dtedges.enumerate(){ 
      edge(..e,marks:"-",mark-scale:50%)
  },
{
  let center = (0,0)
  let rad = 1
  node((rel: (-110deg,1.2*rad),to: center),"",name:<INl>,radius:0mm)
  node((rel: (290deg,1.2*rad),to: center),"",name:<INr>,radius:0mm)
  node((rel: (270deg,.8*rad),to: center),"",name:<INd>,radius:0mm)

  
  node((rel: (-20deg,1.2*rad),to: center),"",name:<IEu>,radius:0mm)
  node((rel: (0deg,1.2*rad),to: center),"",name:<IEr>,radius:0mm)
  node((rel: (20deg,1.2*rad),to: center),"",name:<IEd>,radius:0mm)

  
  node((rel: (200deg,1.2*rad),to: center),"",name:<IWu>,radius:0mm)
  node((rel: (160deg,1.2*rad),to: center),"",name:<IWd>,radius:0mm)
  node((rel: (180deg,1.2*rad),to: center),"",name:<IWl>,radius:0mm)
  
  node((rel: (90deg,.8*rad),to: center),"",name:<ISu>,radius:0mm)
  node((rel: (110deg,1.2*rad),to: center),"",name:<ISl>,radius:0mm)
  node((rel: (70deg,1.2*rad),to: center),"",name:<ISr>,radius:0mm)
  
  node((rel: (-50deg,2.2*rad),to: center),"",name:<OEu>,radius:0mm)
  node((rel: (50deg,2.2*rad),to: center),"",name:<OEd>,radius:0mm)
  node((rel: (0deg,1.8*rad),to: center),"",name:<OEr>,radius:0mm)
  
  node((rel: (230deg,2.2*rad),to: center),"",name:<OWu>,radius:0mm)
  node((rel: (130deg,2.2*rad),to: center),"",name:<OWd>,radius:0mm)
  node((rel: (180deg,1.8*rad),to: center),"",name:<OWl>,radius:0mm)
 }
,{
  edge(<OWu>,<OEu>,bend:41deg,..mom_arr,label:[$p'_e$],label-sep:0mm)
  edge(<OEd>,<OWd>,bend:41deg,..mom_arr,label:[$p_e$],label-sep:0mm)
  edge(<IEr>,<OEr>,shift:-2mm,..mom_arr,label:[$q$],label-side:right,label-sep:-1mm)
  edge(<OWl>,<IWl>,shift:-2mm,..mom_arr,label:[$q$],label-side:right,label-sep:-1mm)
  edge(<IWu>,<INl>,bend:31deg,..mom_arr,label:[$q_4$],label-sep:-1mm)
  edge(<ISl>,<IWd>,bend:31deg,..mom_arr,label:[$q_3$],label-sep:-2mm)
  
  edge(<IEd>,<ISr>,bend:31deg,..mom_arr,label:[$q_2$],label-sep:-1mm)
  edge(<INr>,<IEu>,bend:31deg,..mom_arr,label:[$q_1$],label-sep:-1mm)
  
  edge(<ISu>,<INd>,..mom_arr,shift:2mm,label:[$q_5$],label-side:left,label-sep:0mm)
  
},
  
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
       
        let initial = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        let final = (thickness:options.edge-stroke.thickness,paint:red,cap:"round")
        let initial1 = (thickness:options.edge-stroke.thickness,paint:blue.darken(20%),cap:"round")
        let final1 = (thickness:options.edge-stroke.thickness,paint:red.darken(20%),cap:"round")
        let r1p = (2.1*space,1.34*spacey)
      
        
        let r2p = (3.2*space,2.34*spacey)
      angled_flag(r2p,90deg,2.8*space,stroke:initial,label:[])
      angled_flag(r2p,160deg,3.8*space,stroke:initial1,label:[])

      angled_flag(r2p,200deg,3.8*space,stroke:final1,label:[])
      angled_flag(r2p,-90deg,2.9*space,stroke:final,label:[])
        // angled_flag(r2p,-135deg,3.6*space,stroke:tstroke,label:[$r_1+t_2$],flip:true)

        
        
        // angled_flag(r2p,135deg,3.6*space,stroke:stroke,label:[$r_1$],flip:true)
        
    })
  }

) 