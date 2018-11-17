import random
from man import Man

bx1=[30+100*i for i in range(11)]
bx2=[80+100*i for i in range(11)]

mx1=[45+150*i for i in range(7)]
mx2=[120+150*i for i in range(7)]

fx1=[90+350*i for i in range(3)]
fx2=[265+350*i for i in range(3)]
def setup():
    size(1280, 720)
    global bg
    global hos
    global titl
    global fall_mans_b
    global fall_mans_m
    global fall_mans_f
    global mans
    bg = loadImage("imgs/background.png")
    hos = loadImage("imgs/house.png")
    titl = loadImage("imgs/title.png")
    m1,m2,m3,m4,m5=loadImage("imgs/man1.png"),loadImage("imgs/man2.png"),loadImage("imgs/man3.png"),loadImage("imgs/man4.png"),loadImage("imgs/man5.png")
    mans=[m1,m2,m3,m4,m5]
    fall_mans_b=[[Man(bx1[i] if j%2==0 else bx2[i],52*j,random.randint(0,4),1/4)for i in range(11)]for j in range(14)]
    fall_mans_m=[[Man(mx1[i] if j%2==0 else mx2[i],104*j,random.randint(0,4),1/4)for i in range(7)]for j in range(7)]
    fall_mans_f=[[Man(fx1[i] if j%2==0 else fx2[i],208*j,random.randint(0,4),1/4)for i in range(3)]for j in range(4)]
    
def draw():
    background(bg)
    tint(255,255,255,150);
    for fml in fall_mans_b:
        for fm in fml:
            image(mans[fm.idx],fm.x,fm.y,mans[fm.idx].width /4,mans[fm.idx].height/4)
            fm.y=fm.y+5
            if(fm.y>height):
                fm.y=-20
    tint(255)
    image(hos,0,0)
    tint(255,255,255,200)
    for fml in fall_mans_m:
        for fm in fml:
            image(mans[fm.idx],fm.x,fm.y,mans[fm.idx].width/3,mans[fm.idx].height/3)
            fm.y=fm.y+10
            if(fm.y>height):
                fm.y=-40
    tint(255)
    for fml in fall_mans_f:
        for fm in fml:
            image(mans[fm.idx],fm.x,fm.y,mans[fm.idx].width,mans[fm.idx].height)
            fm.y=fm.y+20
            if(fm.y>height):
                fm.y=-60
    image(titl,0,0)
