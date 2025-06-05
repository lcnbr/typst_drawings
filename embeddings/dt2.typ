#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag

#set page(height: auto,width: auto,margin: 5mm)
#set text(size: 13pt)


// #let angled_flag(puncture,angle,radius,label:[],flip:false,stroke:1pt+black,size:0.16,padding:2mm)={

//    flag(puncture,(rel:(angle,radius),to:puncture),stroke,size:size)
//     cetz.draw.content((rel:(angle,radius+padding),to:puncture),label,angle:if flip{angle+180deg }else{angle},anchor:if flip{"east"}else{"west"})
        
// }


#box(diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
  dtnodes(fill:black,radius:1mm),
  for (eid,e) in dtedges.enumerate(){ 
      edge(..e,marks:"->-",mark-scale:50%)
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
        angled_flag(r1p,45deg,3.5*space,stroke:tstroke,label:[$r_2+t_1-t_2$])
        angled_flag(r1p,145deg,3.*space,stroke:tstroke,label:[$r_2-t_2$],flip:true)
        flag(r1p,(rel:(-20deg,1.4)),(rel:(40deg,1.2)),(rel:(0deg,1.2)),dstroke,size:0.16)
        angled_flag(r1p,-145deg,3.*space,stroke:stroke,label:[$r_2$],flip:true)
        cetz.draw.content((6.1*space,1.6*spacey),[$r_2+t_1-t_2-t_4$],anchor:"center",angle:80deg)

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
