#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide


#let smalldiag = (node-stroke: .1em,
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.06em,
	spacing: 0.2em,
 )

#let dtnodes(..style) ={
  let center = (0,0)
  let rad = 1
  node((rel: (270deg,rad),to: center),"",name:<IN>,..style)
  node((rel: (0deg,rad),to: center),"",name:<IE>,..style)
  node((rel: (180deg,rad),to: center),"",name:<IW>,..style)
  node((rel: (90deg,rad),to: center),"",name:<IS>,..style)
  // hide(node((rel: (0,-2*rad),to: center),"",name:<ON>,..style))
  node((rel: (0deg,2*rad),to: center),"",name:<OE>,..style)
  node((rel: (180deg,2*rad),to: center),"",name:<OW>,..style)
  // node((rel: (0,2*rad),to: center),"",name:<OS>,..style)
 }

#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:88deg),
 (vertices:(<OE>,<OW>),bend:88deg),
 (vertices:(<IW>,<OW>),stroke:(dash:(0.42pt,3pt))),
 (vertices:(<IE>,<OE>),stroke:(dash:(0.42pt,3pt))),
 (vertices:(<IN>,<IE>),bend:43deg),
 (vertices:(<IE>,<IS>),bend:43deg),
 (vertices:(<IW>,<IN>),bend:43deg),
 (vertices:(<IS>,<IW>),bend:43deg),
 (vertices:(<IN>,<IS>)),
  )
 
#let dtsmall(bitvec)={
  box(baseline: 4pt,
 diagram(
	..smalldiag,
 dtnodes(fill:black,radius:0.5pt),
  for (eid,(i,e)) in bitvec.zip(dtedges).enumerate(){
    if i != 0{
      edge(..e,..edgeA)
    }else{
      edge(..e,..edgeB)
    }
  }
)) 
}



 #let dtlarge(bitvec)={
 diagram(
	// node-stroke: 1pt,
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.1em,
	spacing: 2em,
 dtnodes(fill:black,radius:3pt),
  for (eid,(i,e)) in bitvec.zip(dtedges).enumerate(){
    if i !=0{
      edge(..e,..labedgeB(eid+1),stroke:black)
    }else{
      edge(..e,..edgeB)
    }
  }
) 
}