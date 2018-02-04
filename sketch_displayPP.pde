String filename = "dim2/noise_2_1000";

String[] lineData = null;

int []d;
float []x;
float []y;
//float max = 1.0;
//float min = 0.0;
float max = -99999.0;
float min = 99999.0;

int len;

void setup(){
  size(800,800);
  lineData = loadStrings(filename+".csv");
  
  len = lineData.length;
  
  d = new int[len];
  x = new float[len];
  y = new float[len];
  
  
  
  for(int i=0; i<len; i++){
    String[] str = split(lineData[i],",");
    
    d[i] = int(str[0]);
    x[i] = float(str[1]);
    y[i] = float(str[2]);
    
    if(min > x[i]) min = x[i];
    if(min > y[i]) min = y[i];
    if(max < x[i] && x[i]<99999) max = x[i];
    if(max < y[i] && y[i]<99999) max = y[i];
    //println(d[i],x[i],y[i]);
  }
  

   
}

void draw(){
  background(255);
  stroke(0);
  line(50,50,50,750);
  line(50,750,750,750);
  for(int i=0; i<len; i++){
    switch(d[i]){
      case 1: fill(255,0,0);break;
      case 2: fill(0,255,0);break;
      case 3: fill(0,0,255);break;
      case 4: fill(255,255,0);break;
      default : fill(0,0,0);break;
    }
    noStroke();
    ellipse(50 + (x[i]-min)*700/(max-min),750 - (y[i]-min)*700/(max-min),2,2);  
  }
}

void keyPressed(){
  save(filename+".png"); 
}