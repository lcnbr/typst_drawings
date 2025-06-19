#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "../dt.typ": dtedges,dtnodes
#import "../utils.typ":flag,hobby-edge,bezier-edge,angled_flag,puncture

#import "../edge_style.typ": photon,gluon,quark,electron

#set page(height: auto,width: auto,margin: 5mm)
#set text(size: 13pt)
#let node_style = (fill:black,radius:1mm,outset:-0.4mm)


#let dtnodes ={
  let center = (0,0)
  let rad = 1
node((rel: (270deg,rad),to: center),"",name:<IN>,..node_style)
  node((rel: (0deg,rad),to: center),"",name:<IE>,..node_style)
  node((rel: (180deg,rad),to: center),"",name:<IW>,..node_style)
  node(center,"",name:<IS>,..node_style)
  // hide(node((rel: (0,-2*rad),to: center),"",name:<ON>,..node_style))
  node((rel: (0deg,2*rad),to: center),"",name:<OE>,..node_style)
  node((rel: (180deg,2*rad),to: center),"",name:<OW>,..node_style)
  }

 
#let dtedges =  (
 (vertices:(<OW>,<OE>),bend:88deg,..electron),
 (vertices:(<OE>,<OW>),bend:88deg,..electron),
 (vertices:(<IE>,<OE>),..photon),
 (vertices:(<IW>,<OW>),..photon),
 (vertices:(<IN>,<IE>),bend:43deg,..quark),
 // (vertices:(<IE>,<IS>),bend:43deg,..quark),
 (vertices:(<IW>,<IN>),bend:43deg,..quark),
 // (vertices:(<IS>,<IW>),bend:43deg,..quark),
 (vertices:(<IN>,<IS>),bend:0deg,..gluon),
)

#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
 dtnodes,{
    let center = (0,0)
  let rad = 0.4
  hide(node((rel: (0deg,rad),to: center),"",name:<CS>,radius:0pt))
 },
 
 {
   
  for (eid,e) in dtedges.enumerate(){ 
      edge(..e, )
  }
 },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
        // hobby-edge(nodes,<IN>,160deg,<IS>,90deg,through:((1,2),),stroke:options.edge-stroke,pos-along:45%)
        bezier-edge(nodes,<IS>,(-10deg,1.6*space),<IW>,(270deg,2*space),stroke:options.edge-stroke,mark:())
        bezier-edge(nodes,<IE>,(270deg,2*space),<IS>,(190deg,1.6*space),stroke:white+2mm,mark:())
        bezier-edge(nodes,<IE>,(270deg,2*space),<IS>,(190deg,1.6*space),stroke:options.edge-stroke,mark:())
        fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
        let initial = (thickness:0.5mm,paint:blue.lighten(20%),cap:"round")
        let initial1 = (thickness:0.5mm,paint:blue.darken(20%),cap:"round")
        let initial2 = (thickness:0.5mm,paint:blue.darken(0%),cap:"round")
        
        let r1p = (2.55*space,.65*spacey)
        puncture(r1p,stroke:initial,radius:0.14)

        angled_flag(r1p,145deg,3.3*space,stroke:initial,label:[],flip:true)
        angled_flag(r1p,35deg,3.3*space,stroke:initial,label:[],flip:true)
        flag(r1p,(rel:(140deg,.8)),(rel:(30deg,.5)),(rel:(35deg,2.8)),initial1,size:0.16)
        flag(r1p,(rel:(40deg,0.8)),(rel:(150deg,.5)),(rel:(145deg,2.8)),initial2,size:0.16)
       
    })
  }

)
