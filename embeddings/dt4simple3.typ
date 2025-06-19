#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture
#import "dt4simple.typ":dtedges,dtnodes 
#set page(height: auto,width: auto,margin: 5mm)
#set text(size: 13pt)



 
#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
  dtnodes,
  for (eid,e) in dtedges.enumerate(){ 
      edge(..e)
  },
  // node()
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
       
        let initial = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        let final = (thickness:options.edge-stroke.thickness,paint:red,cap:"round")
      
        let final2 = (thickness:options.edge-stroke.thickness,paint:red.darken(20%),cap:"round")
        let final3 = (thickness:options.edge-stroke.thickness,paint:red.darken(40%),cap:"round")
      
        let r1p = (3.1*space,.8*spacey)
        angled_flag(r1p,141deg,3.7*space,stroke:initial,label:[])
        angled_flag(r1p,90deg,3.4*space,stroke:final3,label:[])
        angled_flag(r1p,180deg,3.5*space,stroke:final2,label:[])
        
        angled_flag(r1p,-55deg,2.4*space,stroke:final,label:[])
    })
  }

)

