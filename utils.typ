#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide

#let puncture(center,radius:0.1,stroke:1pt)={
  cetz.draw.circle(center,radius:radius,stroke:stroke,fill:white)
  cetz.draw.line((rel:(45deg,radius),to:center),(rel:(225deg,radius),to:center),stroke:stroke)
  cetz.draw.line((rel:(135deg,radius),to:center),(rel:(315deg,radius),to:center),stroke:stroke)
}

#let flag(..pts-style,size:0.1,stroke)={
  let (pts, style)  = (pts-style.pos(), pts-style.named())

  cetz.draw.hobby(..pts,stroke:stroke,name:"flag")
        cetz.draw.get-ctx(ctx => {
              let (ctx, e,a,c,p) = cetz.coordinate.resolve(ctx, (name:"flag",anchor:0%),(name:"flag",anchor:100%),(name:"flag",anchor:-.1),(name:"flag",anchor:-.2))
              let angle = cetz.vector.angle2(p, a)
            
              cetz.draw.line(p,(rel:(angle - 90deg,2*size),to: c),a,stroke:(thickness:stroke.thickness,cap:"round",join:"round",paint:stroke.paint))
              puncture(e,radius:size,stroke:stroke)
        })
}

#let angled_flag(puncture,angle,radius,label:[],flip:false,stroke:1pt+black,size:0.16,padding:2mm)={

   flag(puncture,(rel:(angle,radius),to:puncture),stroke,size:size)
    cetz.draw.content((rel:(angle,radius+padding),to:puncture),label,angle:if flip{angle+180deg }else{angle},anchor:if flip{"east"}else{"west"})
        
}


#let bezier-edge(nodes,n1,c1,n2,c2,stroke:1pt,pos-along:50%,mark-scale:50%,mark:">",..style)={
  let n1 = fletcher.find-node(nodes, n1)
      let n2 = fletcher.find-node(nodes, n2)
      fletcher.get-node-anchor(n1, c1.at(0), p1 => {
        fletcher.get-node-anchor(n2, c2.at(0), p2 => {
        // make some control points
          let relc1 = (to: p1, rel: c1)
          let relc2 = (to: p2, rel: c2)
          cetz.draw.bezier(
            p1, p2, relc1, relc2,name:"e",
            stroke:stroke,
            ..style
          )
          if mark!=(){
            
          let mark = fletcher.resolve-mark(mark)
          mark.scale=mark-scale
          cetz.draw.get-ctx(ctx => {
              let (ctx, a,p,m) = cetz.coordinate.resolve(ctx, (name:"e",anchor:pos-along),(name:"e",anchor:pos-along - 1%),(name:"e",anchor:pos-along+1%))
              let angle = cetz.vector.angle2(p, m)
              fletcher.draw-mark(mark,origin:(a.at(0),a.at(1)),stroke:stroke,angle:angle)
          })
          }
        })
      })
}

#let hobby-edge(nodes,n1,d1,n2,d2,through:(),stroke:1pt,pos-along:50%,mark-scale:50%,mark:">",..style)={
  let n1 = fletcher.find-node(nodes, n1)
      let n2 = fletcher.find-node(nodes, n2)
      fletcher.get-node-anchor(n1, d1, p1 => {
        fletcher.get-node-anchor(n2, d2, p2 => {
        // make some control points
          // let relc1 = (to: p1, rel: c1)
          // let relc2 = (to: p2, rel: c2)

          let p = (p1,..through,p2)
          cetz.draw.hobby(
            ..p,name:"e",
            stroke:stroke,
            ..style
          )
          let mark = fletcher.resolve-mark(mark)
          mark.scale=mark-scale
          cetz.draw.get-ctx(ctx => {
              let (ctx, a,p,m) = cetz.coordinate.resolve(ctx, (name:"e",anchor:pos-along),(name:"e",anchor:pos-along - 1%),(name:"e",anchor:pos-along+1%))
              let angle = cetz.vector.angle2(p, m)
              fletcher.draw-mark(mark,origin:(a.at(0),a.at(1)),stroke:stroke,angle:angle)
          })
        })
      })
}


#let direct_sum(a,b)={
  if a.len()==b.len(){
    let res = ()
    for (i,j) in a.zip(b){
      if (calc.abs(i)>0) != (calc.abs(j)>0){
        res.push(1)
      }else{
        res.push(0)
      }
    }
    res
  }else{
    panic("a.len != b.len")
  }
}

#let sum(a,b)={
  if a.len()==b.len(){
    let res = ()
    for (i,j) in a.zip(b){
     res.push(i+j)
    }
    res
  }else{
    panic("a.len != b.len")
  }
}

#let diff(a,b)={
  if a.len()==b.len(){
    let res = ()
    for (i,j) in a.zip(b){
     res.push(i - j)
    }
    res
  }else{
    panic("a.len != b.len")
  }
}