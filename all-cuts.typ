#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "dt.typ": dtnodes,dtedges
#import "utils.typ":flag,bezier-edge

#set page(height: 9cm,width: auto)
#set text(size: 13pt)

#let dtnodesperm(..style) ={
  let center = (0,0)
  let rad = 1
  node((rel: (270deg,2*rad),to: center),"",name:<IN>,..style)
  node((rel: (0deg,rad),to: center),"",name:<IE>,..style)
  node((rel: (180deg,rad),to: center),"",name:<IW>,..style)
  node((rel: (90deg,rad),to: center),"",name:<IS>,..style)
  // hide(node((rel: (0,-2*rad),to: center),"",name:<ON>,..style))
  node((rel: (0deg,2*rad),to: center),"",name:<OE>,..style)
  node((rel: (180deg,2*rad),to: center),"",name:<OW>,..style)
  // node((rel: (0,2*rad),to: center),"",name:<OS>,..style)
 }

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
#h(1cm)
#box(diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
 dtnodesperm(fill:black,radius:1mm),{
   let edges =(
 // (vertices:(<OW>,<OE>),bend:48deg),
 (vertices:(<OE>,<OW>),bend:88deg,stroke:purple.darken(20%)),
 (vertices:(<IW>,<OW>),stroke:(dash:(0.42pt,3pt))),
 (vertices:(<IE>,<OE>),stroke:(dash:(0.42pt,3pt))),
 // (vertices:(<IN>,<IE>),bend:43deg),
 (vertices:(<IE>,<IS>),bend:43deg),
 // (vertices:(<IW>,<IN>),bend:43deg),
 (vertices:(<IS>,<IW>),bend:43deg),
 (vertices:(<IN>,<IS>)),
  )
  for (eid,e) in edges.enumerate(){ 
      edge(..e, marks:"->-",mark-scale:50%)
  }
 },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
        bezier-edge(nodes,<OW>,(90deg,1.5*space),<OE>,(90deg,1.5*space),stroke:0.5mm+purple.darken(20%),pos-along:45%)
        bezier-edge(nodes,<IN>,(0deg,1*space),<IE>,(90deg,1*space),stroke:options.edge-stroke,pos-along:78%)
        bezier-edge(nodes,<IW>,(90deg,1*space),<IN>,(180deg,1*space),stroke:options.edge-stroke,pos-along:20%)

        let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        flag((0*space,3*spacey),(3*space,2.9*space),(5*space,3*spacey),stroke,size:0.16)
        cetz.draw.content((-0.5*space,3*spacey),[$t_1$])
        fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
    })
  }

),baseline: -7mm)