class mobiusStrip{
  private float R;
  private float w;
  
  private float x, y, z;
  private ArrayList<PVector> positions;
  
  public mobiusStrip(float R, float w){
    this.R = R;
    this.w = w;
    this.x = 0; this.y = 0; this.z = 0;
    this.positions = new ArrayList();
  }
  
  private void addPos(float t, float s){
    this.x = (R + s * cos(t/2)) * cos(t);
    this.y = (R + s * cos(t/2)) * sin(t);
    this.z = s * sin(t/2);
    positions.add(new PVector(x, y, z));
  }
  
  public int size(){
    return positions.size();
  }
  
  public PVector position(int i){
    return (i < positions.size() ? positions.get(i) : null);
  }
  
  public void del(){
    positions.clear();
  }

  public void make(float incW, float incT){
    for(float s = -1 * this.w; s <= this.w; s += this.w/incW){ // the + determines the number of segments between bands - this is the band position
      for(float t = 0; t <= TWO_PI; t += PI/incT){ // the + determines the number of bands (width) - this is the circumnavigation
        this.addPos(t, s);    
      } 
    }
  }
}
