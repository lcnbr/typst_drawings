#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,bezier-edge,puncture

#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)



#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
 label-sep:-2mm,
 label-wrapper:edge => circle(
// [#edge.label],
inset: 0em,
// radius: em,
fill: white,
stroke: black,
)[ #box(edge.label)],
	spacing: 2em,
  dtnodes(fill:black,radius:1mm),{
    let lab = (0,1,2,3,2,2,3,4,5)
  // node((30mm,12mm),[s],),
  for (e,l) in dtedges.zip(lab){ 
      edge(..e,marks:"->-",mark-scale:50%,[#str(l)])
  }
  },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
       
        let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        let r2p = (3.2*space,1.34*spacey)
        puncture(r2p,stroke:stroke,radius:0.16)
        
    })
  }

) 
#box(diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
 label-sep:1mm,
	spacing: 2em,
  dtnodes(fill:black,radius:1mm),{
    let lab = (0,1,2,3,2,2,3,4,5)
  for (e,l) in dtedges.zip(lab){ 
      edge(..e,marks:"->-",mark-scale:50%,[#str(l)])
    }
  },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
       
        let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        let r1p = (2.1*space,1.34*spacey)
        puncture(r1p,stroke:stroke,radius:0.16)
        
    })
  }

),baseline: 0cm)

#h(7cm)
// #diagram(
//  node-shape:circle,
// 	node-fill: black,
//  edge-stroke:0.5mm,
// 	spacing: 2em,
//  dtnodes(fill:black,radius:1mm),{
//     let center = (0,0)
//   let rad = 0.4
//   hide(node((rel: (0deg,rad),to: center),"",name:<CS>,radius:0pt))
//  },
 
//  {
//    let edges =(
//  (vertices:(<OW>,<OE>),bend:88deg),
//  (vertices:(<OE>,<OW>),bend:88deg),
//  (vertices:(<IW>,<OW>),stroke:(dash:(0.42pt,3pt))),
//  (vertices:(<IE>,<OE>),stroke:(dash:(0.42pt,3pt))),
//  (vertices:(<IN>,<IE>),bend:43deg),
//  (vertices:(<IE>,<IS>),bend:43deg),
//  (vertices:(<IW>,<IN>),bend:43deg),
//  (vertices:(<IS>,<IW>),bend:43deg),
//  // (vertices:(<IN>,<IS>)),
//   )
//   for (eid,e) in edges.enumerate(){ 
//       edge(..e, marks:"->-",mark-scale:50%)
//   }
//  },
//   render: (grid, nodes, edges, options) => {
//     let space = options.spacing.at(0)
//     let spacey = options.spacing.at(1)
//     fletcher.cetz.canvas({
//         // hobby-edge(nodes,<IN>,160deg,<IS>,90deg,through:((1,2),),stroke:options.edge-stroke,pos-along:45%)
//         bezier-edge(nodes,<IN>,(200deg,1.5*space),<CS>,(270deg,1.3*space),stroke:options.edge-stroke,pos-along:75%)
        
//         bezier-edge(nodes,<CS>,(90deg,1.3*space),<IS>,(160deg,1.5*space),stroke:options.edge-stroke,pos-along:85%)
//         let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
//         // cetz.draw.content((-0.5*space,3*spacey),[$t_1$])
//         fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
//         let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
//         let r1p = (2.7*space,1.34*spacey)
//         puncture(r1p,stroke:stroke,radius:0.16)
       
//     })
//   }

// )
// #h(1fr)