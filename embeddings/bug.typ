#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, cetz,edge,hide

#set page(height: auto,width: 15cm,margin: 3mm)
#diagram(node((0,0),name:<A>),node((0,1),name:<B>),edge(<A>,<B>,shift:3mm,"->-"))