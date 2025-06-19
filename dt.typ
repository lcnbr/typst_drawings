#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide

#import "edge_style.typ":photon,gluon,quark,electron 
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
 (vertices:(<OW>,<OE>),bend:88deg,..electron),
 (vertices:(<OE>,<OW>),bend:88deg,..electron),
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN>,<IE>),bend:43deg,..quark),
 (vertices:(<IE>,<IS>),bend:43deg,..quark),
 (vertices:(<IW>,<IN>),bend:43deg,..quark),
 (vertices:(<IS>,<IW>),bend:43deg,..quark),
 (vertices:(<IN>,<IS>),..gluon),
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
#let dtrealsmall(bitvec,scale:1.5mm,radius:0.3mm)={
  
let d = diagram(
	..smalldiag,
 spacing:scale,
 dtnodes(radius:radius,layer:-1,fill:black,stroke:1pt+black.lighten(40%)),{
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

 #let dtlargesimple(bitvec)={
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
      edge(..e)
    }else{
      edge(..e,..edgeB)
    }
  }
) 
}
#set text(size: 13pt)
#dtlarge((1,1,1,1,1,1,1,1,1,))


#dtsmall((1.,0,0,1.,1.,1.,0,1.,0,),scale:4mm)
#dtsmall((1.,1.,0,0,0,0,0,0,0,),scale:4mm)
#dtsmall((1.,0,-1.,1.,0,1.,0,1.,0,),scale:4mm)
#dtsmall((0,0,0,0,1.,1.,0,0,-1.,),scale:4mm)
#dtsmall((0,0,0,0,1.,1.,1.,1.,0,),scale:4mm)

#dtrealsmall((1,1,1,1,1,1,1,1,1,),radius:0mm,scale:0.8mm)