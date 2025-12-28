// Grid Phyllotaxis dengan Bezier
int cellSize = 70;
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

  // Update semua node
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].update();
  }

  // Gambar hanya titik-titik (tanpa bezier/intersection)
  fill(0);
  noStroke();
  for (int i = 0; i < nodes.length; i++) {
    Node n = nodes[i];
    // Hanya gambar jika valid atau belum animasi
    if (n.isValid || !n.animating) {
      circle(n.x, n.y, 4);  // Titik kecil
    }
  }
}

// Mouse click untuk memulai animasi
void mousePressed() {
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].startAnimation();
  }
}
