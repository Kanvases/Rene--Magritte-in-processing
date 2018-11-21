ArrayList particles;
PImage sky;
PImage door;
float trX=0;
float opt=10;
float lop=-1;
void setup()
{
  size(1024, 695, P2D);
  frameRate(60);
  rectMode(CENTER);
  noStroke();
  sky=loadImage("imgs/bg.png");
  door=loadImage("imgs/door.png");
  particles = new ArrayList();
  particles.add(new Particle(500, 300, 50, color(255), 12));
  particles.add(new Particle(0, 450, 50, color(255), 12));
  particles.add(new Particle(200, 200, 40, color(255), 12));
  particles.add(new Particle(850, 100, 50, color(255), 12));
  particles.add(new Particle(700, 450, 40, color(255), 12));
  particles.add(new Particle(-500, 300, 50, color(255), 12));
  particles.add(new Particle(0, 450, 50, color(255), 12));
  particles.add(new Particle(-200, 200, 40, color(255), 12));
  particles.add(new Particle(-850, 100, 50, color(255), 12));
  particles.add(new Particle(-700, 450, 40, color(255), 12));
  image(sky,0,0);
    for(int i = 0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    if(p.alive){
      p.reproduce();
    }
  }
}

void draw()
{
  float Fsiz=sin(lop)+5;
  //trX+=5;
  if(trX>width){
    trX=-100;
  }
  image(sky,0,0);
  pushMatrix();
  translate(trX,0);
    for(int i = 0; i < particles.size(); i++){
      Particle p = (Particle) particles.get(i);
      p.drawParticle();
      
  }
  popMatrix();
  image(door,0,0);
  
  float Insiz=1;
  for(int i=0;i<10;i++){
     fill(color(206,222,206), opt);
     ellipse(width/2, 200, Fsiz*Insiz, Fsiz*Insiz);
     Insiz+=2;
  }
  opt=10;
  lop +=0.5;
  if(lop>2*3.141){
    lop=0;
  }
}

class Particle
{
  PVector position;
  float oppacity;
  float w;
  color clr;
  boolean alive;
  
  protected Particle(float x, float y, float wth, color c, float o)
  {
    position = new PVector(x, y);
    w = wth;
    clr = c;
    oppacity = o;
    alive = true;
  }
  
  public void reproduce()
  {
    if(w > 1)
    {
      for(int i = 0; i < 2; i++)
      {
        float newX = position.x + random(-w, w);
        float newY = position.y + random(-w/2, w/4);
        float r = random(10);
        float newW = w - r;
        if(newW < 1)
          newW = 1;
        particles.add(new Particle(newX, newY, newW, clr, oppacity));
        alive = false;
      }
    }
  }
  
  public void drawParticle()
  {
    fill(clr, oppacity);
    ellipse(position.x, position.y, w, w);
  }
}
