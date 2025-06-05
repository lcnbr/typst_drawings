#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide


#let smalldiag = (node-stroke: .1em,
 node-shape:circle,
	// node-fill: black,
 edge-stroke:0.08em,
	// spacing: 1.5mm,
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
 (vertices:(<OW>,<OE>),bend:88deg,stroke:purple.darken(20%)),
 (vertices:(<OE>,<OW>),bend:88deg,stroke:purple.darken(20%)),
 (vertices:(<IE>,<OE>),stroke:(dash:(0.42pt,3pt))),
 (vertices:(<IW>,<OW>),stroke:(dash:(0.42pt,3pt))),
 (vertices:(<IN>,<IE>),bend:43deg),
 (vertices:(<IE>,<IS>),bend:43deg),
 (vertices:(<IW>,<IN>),bend:43deg),
 (vertices:(<IS>,<IW>),bend:43deg),
 (vertices:(<IN>,<IS>)),
  )

  #let edgeA = (marks:"-",mark-scale:10%)
#let edgeB = (marks:"-",stroke:gray,mark-scale:10%)


#let dtsmall(bitvec,scale:1.5mm)={
  
let d = diagram(
	..smalldiag,
 spacing:scale,
 dtnodes(radius:0.3mm,layer:-1,fill:black,stroke:1pt+black.lighten(40%)),{
  let dtedges =  (
 (vertices:(<OW>,<OE>),bend:88deg),
 (vertices:(<OE>,<OW>),bend:88deg),
 (vertices:(<IE>,<OE>)),
 (vertices:(<IW>,<OW>)),
 (vertices:(<IN>,<IE>),bend:43deg),
 (vertices:(<IE>,<IS>),bend:43deg),
 (vertices:(<IW>,<IN>),bend:43deg),
 (vertices:(<IS>,<IW>),bend:43deg),
 (vertices:(<IN>,<IS>)),
  ) 
  for (eid,(i,e)) in bitvec.zip(dtedges).enumerate(){
    if i != 0{
      if type(i)==float{
        if i>0.{
        edge(..e,marks:((inherit:">",pos:0.5),),mark-scale:40%)
          
        }else{
        edge(..e,marks:((inherit:">",pos:0.5,rev:true),),mark-scale:40%)
          
        }
        
      }else{
        edge(..e,..edgeA)
        
      }
    }else{
      edge(..e,..edgeB,stroke:(dash:"dotted",paint:black.lighten(80%)))
    }
  }
 }
)
// context {
//   let (width, height) = measure(d)
//   // width*50%
//   place(d)
// }
d
}


#let labedgeB(eid) = (marks:"->-",mark-scale:40%,label:box([$e_#str(eid)$]),label-sep:1mm)
#set page(height: auto,width: auto,margin: 5mm)
 #let dtlarge(bitvec)={
 diagram(
	// node-stroke: 1pt,
 // debug:true,
 node-shape:circle,
	node-fill: black,
edge-stroke:0.5mm,
	spacing: 2em,
 dtnodes(fill:black,radius:1mm),
  for (eid,(i,e)) in bitvec.zip(dtedges).enumerate(){
    if i !=0{
      edge(..e,..labedgeB(eid+1))
    }else{
      edge(..e,..edgeB)
    }
  }
) 
}
#set text(size: 13pt)
#dtlarge((1,1,1,1,1,1,1,1,1,))