#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide

// #import "../dt.typ": dtnodes,dtedges
#import "../utils.typ":angled_flag,flag,puncture

#set page(height: auto,width: 15cm,margin: 3mm)
#set text(size: 11pt)
#let node_style = (radius:1mm,stroke:2pt)
#let diag_style= (
  node-shape:circle,
  node-inset:1mm,
  edge-stroke:1.5pt,
 spacing:10mm,
  node-fill:black,)
#let sedge(color,left:true,rev:false)=(marks:((inherit:">",pos:if left{0.4}else{0.6},scale:30%,rev:rev),),shift:if left{1.5pt}else{-1.5pt},stroke:1.5pt+color)
#set align(center)
#grid(
  columns: (1fr,1fr,1fr,1fr),
  align: center,

  {diagram(
  ..diag_style,
  node((0,1),name:<S>,..node_style),
  node((0,-1),name:<N>,..node_style),
  edge(<N>,<S>,..sedge(blue,left:false,rev:true),[$c_2$],label-sep:5mm),
  edge(<N>,<S>,..sedge(blue),bend:-88deg),
  edge(<S>,<N>,..sedge(green,left:false),[$c_3$],label-side:right,label-sep:5mm),
  edge(<N>,<S>,..sedge(green,left:false),bend:88deg,[$c_1$]),
  edge(<S>,<N>,..sedge(red,left:true),bend:88deg),
  edge(<N>,<S>,..sedge(red,left:true),bend:88deg),
)}
,{let edgestyle = (marks:((inherit:">",pos:0.5,scale:40%),))
box(diagram(

  ..diag_style,
  node((0,1),name:<S>,..node_style),
  node((0,-1),name:<N>,..node_style),
  
  edge(<S>,<N>,..edgestyle,[$e_1$]),
  edge(<S>,<N>,..edgestyle,bend:88deg,[$e_2$]),
  edge(<N>,<S>,..edgestyle,bend:88deg,[$e_3$]),
),baseline: 0mm)},
{let edgestyle = (marks:((inherit:">",pos:0.5,scale:40%),),label-side:center,label-pos:0.25,label-wrapper: e =>
circle(e.label, fill: e.label-fill,inset: 0mm,stroke: black))
box(diagram(
  ..diag_style,
  node((0,1),name:<S>,..node_style),
  node((0,-1),name:<N>,..node_style),
  edge(<S>,<N>,..edgestyle,box(baseline: -3pt,[-1])),
  edge(<S>,<N>,..edgestyle,bend:88deg,[#h(0.5mm)2]),
  edge(<N>,<S>,..edgestyle,bend:88deg,[#h(0.5mm)1]), 
  render: (grid, nodes, edges, options) => {
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
        puncture((-0.6,1.6),radius:0.16,stroke:1.5pt+blue)    
    })
  }
),baseline: 0mm)},
{let edgestyle = (label-side:center,label-pos:0.5,label-wrapper: e =>
circle(e.label, fill: e.label-fill,inset: 0mm,stroke: black))
box(diagram(
  ..diag_style,
  node((0,1),name:<S>,..node_style),
  node((0,-1),name:<N>,..node_style),
  edge(<S>,<N>,..edgestyle,[#h(0.5mm)1]),
  edge(<S>,<N>,..edgestyle,bend:88deg,[#h(0.5mm)2]),
  edge(<N>,<S>,..edgestyle,bend:88deg,[#h(0.5mm)1]), 
  render: (grid, nodes, edges, options) => {
    fletcher.cetz.canvas({
      fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
        puncture((-0.6,1.6),radius:0.16,stroke:1.5pt+blue)    
    })
  }
),baseline: 0mm)}
)