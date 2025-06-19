#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide

#import "edge_style.typ":photon,gluon,quark,electron 
#let smalldiag = (node-stroke: .1em,
 node-shape:circle,
	// node-fill: black,
 edge-stroke:0.08em,
	// spacing: 1.5mm,
 )

#let senodes(..style) ={
  let center = (0,0)
  let rad = 1
  node((rel: (210deg,rad),to: center),"",name:<IN1>,..style)
  node((rel: (330deg,rad),to: center),"",name:<IN2>,..style)
  node((rel: (30deg,rad),to: center),"",name:<IE>,..style)
  node((rel: (150deg,rad),to: center),"",name:<IW>,..style)
  // node((rel: (90deg,rad),to: center),"",name:<IS>,..style)
  // hide(node((rel: (0,-2*rad),to: center),"",name:<ON>,..style))
  node((rel: (30deg,2*rad),to: center),"",name:<OE>,..style)
  node((rel: (150deg,2*rad),to: center),"",name:<OW>,..style)
  // node((rel: (0,2*rad),to: center),"",name:<OS>,..style)
 }

#let seedges =  (
 (vertices:(<OW>,<OE>),bend:118deg,..electron),
 (vertices:(<OE>,<OW>),bend:58deg,..electron),
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN2>,<IE>),bend:23deg,..quark),
 (vertices:(<IE>,<IW>),bend:58deg,..quark),
 (vertices:(<IW>,<IN1>),bend:23deg,..quark),
 (vertices:(<IN1>,<IN2>),bend:56deg,..quark),
 (vertices:(<IN1>,<IN2>),bend:-60deg,..quark),
  )

  #let edgeA = (marks:"-",mark-scale:10%)
#let edgeB = (marks:"-",stroke:gray,mark-scale:10%)


#let sesmall(bitvec,scale:1.5mm)={
  
let d = diagram(
	..smalldiag,
 spacing:scale,
 senodes(radius:0.3mm,layer:-1,fill:black,stroke:1pt+black.lighten(40%)),{
  let seedges =  (
  (vertices:(<OW>,<OE>),bend:118deg,),
 (vertices:(<OE>,<OW>),bend:58deg,),
 (vertices:(<IE>,<OE>),),
 (vertices:(<IW>,<OW>),),
 (vertices:(<IN2>,<IE>),bend:23deg,),
 (vertices:(<IE>,<IW>),bend:58deg,),
 (vertices:(<IW>,<IN1>),bend:23deg,),
 (vertices:(<IN1>,<IN2>),bend:56deg,),
 (vertices:(<IN1>,<IN2>),bend:-60deg,),
  ) 
  for (eid,(i,e)) in bitvec.zip(seedges).enumerate(){
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
#let serealsmall(bitvec,scale:1.5mm,radius:0.3mm)={
  
let d = diagram(
	..smalldiag,
 spacing:scale,
 senodes(radius:radius,layer:-1,fill:black,stroke:1pt+black.lighten(40%)),{
  let seedges =  (
  (vertices:(<OW>,<OE>),bend:118deg,),
 (vertices:(<OE>,<OW>),bend:58deg,),
 (vertices:(<IE>,<OE>),),
 (vertices:(<IW>,<OW>),),
 (vertices:(<IN2>,<IE>),bend:23deg,),
 (vertices:(<IE>,<IW>),bend:58deg,),
 (vertices:(<IW>,<IN1>),bend:23deg,),
 (vertices:(<IN1>,<IN2>),bend:56deg,),
 (vertices:(<IN1>,<IN2>),bend:-60deg,),
  ) 
  for (eid,(i,e)) in bitvec.zip(seedges).enumerate(){
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
 #let selarge(bitvec)={
 diagram(
	// node-stroke: 1pt,
 // debug:true,
 node-shape:circle,
	node-fill: black,
edge-stroke:0.5mm,
	spacing: 2em,
 senodes(fill:black,radius:1mm),
  for (eid,(i,e)) in bitvec.zip(seedges).enumerate(){
    if i !=0{
      edge(..e,..labedgeB(eid+1))
    }else{
      edge(..e,..edgeB)
    }
  }
) 
}
 #let selargesimple(bitvec)={
 diagram(
	// node-stroke: 1pt,
 // debug:true,
 node-shape:circle,
	node-fill: black,
edge-stroke:0.5mm,
	spacing: 2em,
 senodes(fill:black,radius:1mm),
  for (eid,(i,e)) in bitvec.zip(seedges).enumerate(){
    if i !=0{
      edge(..e)
    }else{
      edge(..e,..edgeB)
    }
  }
) 
}



#set text(size: 13pt)
#selarge((1,1,1,1,1,1,1,1,1,))

#sesmall((-1.,0,0,1.,1.,1.,0,0,1.,),scale:4mm)
#sesmall((-1.,-1.,0,0,0,0,0,0,0,),scale:4mm)
#sesmall((-1.,0,-1.,1.,0,1.,0,0,0,),scale:4mm)
#sesmall((0,0,0,0,0,0,0,-1.,1.,),scale:4mm)
#sesmall((0,0,0,0,1.,1.,1.,0,1.,),scale:4mm)

#serealsmall((1,1,1,1,1,1,1,1,1,),radius:0mm,scale:0.8mm)