#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "dt.typ": dtnodes,dtedges
#import "utils.typ":flag

#set page(height: 9cm,width: auto)
#set text(size: 13pt)



#diagram(
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
        flag((2*space,4.5*spacey),(2*space,-2*spacey),stroke,size:0.16)
        cetz.draw.content((2*space,5*spacey),[$t_2$])
        flag((3.2*space,4.5*spacey),(3.2*space,-2*spacey),stroke,size:0.16)
        cetz.draw.content((3.2*space,5*spacey),[$t_3$])
        flag((4.2*space,4*spacey),(4.2*space,-1.4*spacey),stroke,size:0.16)
        cetz.draw.content((4.2*space,4.5*spacey),[$t_4$])
        flag((1*space,4*spacey),(1*space,-1.4*spacey),stroke,size:0.16)
        cetz.draw.content((1*space,4.5*spacey),[$t_5$])
        
    })
  }

) 