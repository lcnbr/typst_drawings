#import "../dt.typ": dtsmall
#import "../utils.typ": direct_sum,sum,diff,
#set page(height: auto,width: auto,margin: 5mm)
#set text(size: 13pt)



#let c1 =(1.,0,-1,1,-1,0,0,1,1)
#let c2=(0,1.,1,-1,1,0,0,-1,-1)
#let c3=(0,0,0,0,1.,1,0,0,-1)
#let c4=(0,0,0,0,0,0,1,1,1.)
#let scale = 5mm

#let cycle_with_label(c,name,inset:(x: 0pt, y: 2mm))={
  grid(
    columns: 1,
    align: center,
    box(dtsmall(c,scale:4mm),outset: -1mm,inset:inset),
    name
  )
}
#let arrow-inset = (x:0pt,y:1.35mm)

#grid(
  gutter: 4mm,
columns: 6,
align: bottom+center,
cycle_with_label(c1,[$d_1$]),
cycle_with_label(c2,[$d_2$],inset:arrow-inset),
cycle_with_label(c3,[$d_3$]),
cycle_with_label(c4,[$d_4$]),
cycle_with_label(sum(c1,c2),[$d_1+d_2$],inset:arrow-inset),
cycle_with_label(sum(c1,c3),[$d_1+d_3$]),
cycle_with_label(diff(c1,c4),[$d_1-d_4$]),
cycle_with_label(diff(c2,c3),[$d_2-d_3$],inset:arrow-inset),
cycle_with_label(sum(c2,c4),[$d_2+d_4$],inset:arrow-inset),
cycle_with_label(sum(c3,c4),[$d_3+d_4$]),
cycle_with_label(diff(sum(c1,c3),c4),[$d_1+d_3-d_4$]),
cycle_with_label(sum(diff(c2,c3),c4),[$d_2-d_3+d_4$],inset:arrow-inset),
)

// #box(dtsmall(sum(c1,c2),scale:3mm),inset: 0.3mm)



// #box(dtsmall((0,0,-1.,1.,-1.,0,0,1.,1.,),scale:2mm),inset: 0.3mm)