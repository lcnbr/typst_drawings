#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide

// #import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture

#set page(height: auto,width: auto,margin: 3mm)
#set text(size: 13pt)

#let sedge(color,left:true,rev:false)=(marks:((inherit:">",pos:if left{0.4}else{0.6},scale:30%,rev:rev),),shift:if left{2pt}else{-2pt},stroke:2pt+color)

#diagram(
  node-shape:circle,
  node-inset:1mm,
  edge-stroke:2pt,
  
  node-fill:black,
  // node((1,0),name:<E>,radius:1mm,stroke:4pt),
  // node((-1,0),name:<W>,radius:1mm,stroke:4pt),
  node((0,1),name:<S>,radius:1mm,stroke:4pt),
  node((0,-1),name:<N>,radius:1mm,stroke:4pt),
  edge(<N>,<S>,..sedge(blue,left:false,rev:true),[$c_2$],label-sep:5mm),
  edge(<N>,<S>,..sedge(blue),bend:-88deg),
  edge(<S>,<N>,..sedge(green,left:false),[$c_3$],label-side:right,label-sep:5mm),
  edge(<N>,<S>,..sedge(green,left:false),bend:88deg,[$c_1$]),
  edge(<S>,<N>,..sedge(red,left:true),bend:88deg),
  edge(<N>,<S>,..sedge(red,left:true),bend:88deg),
)
#let edgestyle = (marks:((inherit:">",pos:0.5,scale:40%),))
#h(1cm)
#box(diagram(
  node-shape:circle,
  node-inset:1mm,
  edge-stroke:2pt,
  
  node-fill:black,
  node((0,1),name:<S>,radius:1mm,stroke:4pt),
  node((0,-1),name:<N>,radius:1mm,stroke:4pt),
  
  edge(<N>,<S>,..edgestyle,[$e_1$]),
  edge(<N>,<S>,..edgestyle,bend:-88deg,[$e_2$]),
  edge(<S>,<N>,..edgestyle,bend:-88deg,[$e_3$]),
),baseline: 2mm)
#h(1cm)
#let edgestyle = (marks:((inherit:">",pos:0.5,scale:40%),),label-side:center,label-pos:0.25,label-wrapper: e =>
circle(e.label, fill: e.label-fill,inset: 0mm,stroke: black))
#box(diagram(
  node-shape:circle,
  node-inset:1mm,
  edge-stroke:2pt,
  
  node-fill:black,
  node((0,1),name:<S>,radius:1mm,stroke:4pt),
  node((0,-1),name:<N>,radius:1mm,stroke:4pt),
  edge(<N>,<S>,..edgestyle,box(baseline: -3pt,[-1])),
  edge(<N>,<S>,..edgestyle,bend:-88deg,[#h(0.5mm)2]),
  edge(<S>,<N>,..edgestyle,bend:-88deg,[#h(0.5mm)1]), 
  render: (grid, nodes, edges, options) => {
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
        puncture((-0.6,1.6),radius:0.16,stroke:1.5pt+blue)    
    })
  }
),baseline: 0mm)
#h(1cm)
#box(diagram(
  node-shape:circle,
  node-inset:1mm,
  edge-stroke:2pt,
  
  node-fill:black,
  node((0,1),name:<S>,radius:1mm,stroke:4pt),
  node((0,-1),name:<N>,radius:1mm,stroke:4pt),
  edge(<S>,<N>,..edgestyle,box(baseline: 0mm,[#h(0.5mm)1])),
  edge(<N>,<S>,..edgestyle,bend:-88deg,[#h(0.5mm)2]),
  edge(<S>,<N>,..edgestyle,bend:-88deg,[#h(0.5mm)1]), 
  render: (grid, nodes, edges, options) => {
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
        puncture((-0.6,1.6),radius:0.16,stroke:1.5pt+blue)    
    })
  }
),baseline: 0mm)