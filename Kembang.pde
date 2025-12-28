// Grid Phyllotaxis dengan Bezier
int cellSize = 99;
Node[] nodes;  // Array untuk menyimpan semua node intersection

void setup() {
  fullScreen();
  //size(1920, 1080);

  // Hitung jumlah kolom dan baris
  int cols = width / cellSize;
  int rows = height / cellSize;

  // Buat node untuk setiap intersection point
  // (cols + 1) x (rows + 1) node
  int totalNodes = (cols + 1) * (rows + 1);
  nodes = new Node[totalNodes];

  float goldenAngle = 137.5 * (PI / 180); //konversi ke radian
  float centerX = width / 2;
  float centerY = height / 2;

  // Inisialisasi semua node
  int index = 0;
  for (int j = 0; j <= rows; j++) {
    for (int i = 0; i <= cols; i++) {
      // Posisi grid normal
      float startX = i * cellSize;
      float startY = j * cellSize;

      // Hitung posisi Phyllotaxis
      float angle = index * goldenAngle;
      float radius = cellSize * 0.3 * sqrt(index);
      float targetX = centerX + radius * cos(angle);
      float targetY = centerY + radius * sin(angle);

      // Cek apakah valid
      boolean valid = (targetX >= 0 && targetX <= width &&
                       targetY >= 0 && targetY <= height);

      nodes[index] = new Node(startX, startY, targetX, targetY, valid);
      index++;
    }
  }
}

void draw() {
  // Background transparan untuk efek trail
  fill(255, 20);  // Putih dengan alpha 20 (transparan)
  noStroke();
  rect(0, 0, width, height);
  
  stroke(0);
  strokeWeight(2);
  // Update semua node
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].update();
  }
  
  int cols = width/cellSize;
   int rows = height/cellSize;
   
   //Gambar bezier vertikal
   for(int i=0;i<=cols;i++){
     for(int j=0;j<rows;j++){
       int node1 = j*(cols+1)+i;
       int node2 = (j+1) * (cols+1)+i;
       
       Node n1 = nodes[node1];
       Node n2 = nodes[node2];
       
       if((n1.isValid || !n1.animating) && (n2.isValid || !n2.animating)){
         
         float curveAmount = cellSize * 0.15;
         bezier(
         n1.x,n1.y,
         n1.x+curveAmount,(n1.y+n2.y)/2,
         n2.x-curveAmount,(n1.y+n2.y)/2,
         n2.x,n2.y
         );
       }
     }
   }
   
   //Gambar bezier horisontal
   for(int j=0;j<=rows;j++){
     for(int i=0;i<cols;i++){
       int node1 = j*(cols+1)+i;
       int node2 = j*(cols+1) + (i+1);
       
       Node n1 = nodes[node1];
       Node n2 = nodes[node2];
       
       if((n1.isValid || !n1.animating) && (n2.isValid || !n2.animating)){
         float curveAmount =  cellSize * 0.15;
         
         bezier(
         n1.x,n1.y,
         (n1.x+n2.x)/2,n1.y+curveAmount,
         (n1.x+n2.x)/2,n2.y-curveAmount,
         n2.x,n2.y);
       }       
     }
   }

}

// Mouse click untuk memulai animasi
void mousePressed() {
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].startAnimation();
  }
}
