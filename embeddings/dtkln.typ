#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag

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
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
       
        let initial = (thickness:options.edge-stroke.thickness,paint:rgb(100%,0%,0%),cap:"round")
        let final = (thickness:options.edge-stroke.thickness,paint:rgb(0%,0%,100%),cap:"round")
        let r1p = (3.2*space,1.63*spacey)
      
        
        let r2p = (3.2*space,1*spacey)
      // flag(r2p,(rel:(90deg,1.4)),(rel:(180deg,1)),(rel:(-104deg,1.2)),(rel:(-160deg,2.6)),tstroke,size:0.16)
      //   cetz.draw.content((-1.1*space,0.8*spacey),[$r_2+t_2$],anchor:"east",angle:-4deg)
        
      // flag(r2p,(rel:(-90deg,1.4)),(rel:(180deg,1)),(rel:(104deg,1.2)),(rel:(160deg,2.6)),dstroke,size:0.16)
      // cetz.draw.content((-1.2*space,2*spacey),[$r_1+t_1+t_3-t_2$],anchor:"center",angle:80deg)
        
        fletcher.cetz.draw.line(r2p,(rel:(-35deg,2.6*space)),stroke:initial)
        fletcher.cetz.draw.line(r1p,(rel:(35deg,2.6*space)),stroke:final)
        // angled_flag(r2p,35deg,2.6*space,stroke:final,label:[])
        // angled_flag(r2p,-135deg,3.6*space,stroke:tstroke,label:[$r_1+t_2$],flip:true)

        
        
        // angled_flag(r2p,135deg,3.6*space,stroke:stroke,label:[$r_1$],flip:true)
        
    })
  }

) 