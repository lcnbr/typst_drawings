#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide
#import "dt.typ": dtedges,dtnodes
#import "utils.typ":flag,hobby-edge,bezier-edge,angled_flag


#set page(height: 8cm,width: 10cm)
#set text(size: 13pt)


#diagram(
 node-shape:circle,
	node-fill: black,
 edge-stroke:0.5mm,
	spacing: 2em,
 dtnodes(fill:black,radius:1mm),{
    let center = (0,0)
  let rad = 0.4
  hide(node((rel: (0deg,rad),to: center),"",name:<CS>,radius:0pt))
 },
 
 {
   let edges =(
 (vertices:(<OW>,<OE>),bend:88deg),
 (vertices:(<OE>,<OW>),bend:88deg),
 (vertices:(<IW>,<OW>),stroke:(dash:(0.42pt,3pt))),
 (vertices:(<IE>,<OE>),stroke:(dash:(0.42pt,3pt))),
 (vertices:(<IN>,<IE>),bend:43deg),
 (vertices:(<IE>,<IS>),bend:43deg),
 (vertices:(<IW>,<IN>),bend:43deg),
 (vertices:(<IS>,<IW>),bend:43deg),
 // (vertices:(<IN>,<IS>)),
  )
  for (eid,e) in edges.enumerate(){ 
      edge(..e, marks:"->-",mark-scale:50%)
  }
 },
  render: (grid, nodes, edges, options) => {
    let space = options.spacing.at(0)
    let spacey = options.spacing.at(1)
    fletcher.cetz.canvas({
        // hobby-edge(nodes,<IN>,160deg,<IS>,90deg,through:((1,2),),stroke:options.edge-stroke,pos-along:45%)
        bezier-edge(nodes,<IN>,(200deg,1.5*space),<CS>,(270deg,1.3*space),stroke:options.edge-stroke,pos-along:75%)
        
        bezier-edge(nodes,<CS>,(90deg,1.3*space),<IS>,(160deg,1.5*space),stroke:options.edge-stroke,pos-along:85%)
        let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        // cetz.draw.content((-0.5*space,3*spacey),[$t_1$])
        fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
        let stroke = (thickness:options.edge-stroke.thickness,paint:blue,cap:"round")
        let tstroke = stroke
        tstroke.paint=blue.lighten(50%)
        let r1p = (2.7*space,1.34*spacey)
        angled_flag(r1p,-40deg,3.5*space,stroke:tstroke,label:[$r_4+t_3$])
        // flag(r1p,)
        
        angled_flag(r1p,-150deg,3.5*space,stroke:tstroke,label:[$r_3+t_2$],flip:true)
        angled_flag(r1p,150deg,3.5*space,stroke:stroke,label:[$r_3$],flip:true)
        
       
        angled_flag(r1p,40deg,3.5*space,stroke:stroke,label:[$r_4$])
       
    })
  }

)