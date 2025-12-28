// Class Node - Titik intersection grid yang beranimasi

class Node {
  float x, y;              // Posisi saat ini
  float startX, startY;    // Posisi awal (grid normal)
  float targetX, targetY;  // Posisi target (Phyllotaxis)
  boolean isValid;         // Apakah node valid (dalam bounds)

  // Animasi
  boolean animating = false;
  float animProgress = 0.0;
  float animSpeed = 0.008;  // Kecepatan animasi

  // Constructor
  Node(float startX, float startY, float targetX, float targetY, boolean valid) {
    this.startX = startX;
    this.startY = startY;
    this.targetX = targetX;
    this.targetY = targetY;
    this.x = startX;
    this.y = startY;
    this.isValid = valid;
  }

  // Method untuk memulai animasi
  void startAnimation() {
    animating = true;
    animProgress = 0.0;
  }

  // Method untuk mengupdate posisi
  void update() {
    if (animating) {
      animProgress += animSpeed;
      if (animProgress >= 1.0) {
        animProgress = 1.0;
        animating = false;
      }

      // Easing function (ease-in-out)
      float t = animProgress;
      float ease = t < 0.5 ? 4 * t * t * t : 1 - pow(-2 * t + 2, 3) / 2;

      // Interpolasi posisi
      x = lerp(startX, targetX, ease);
      y = lerp(startY, targetY, ease);
    }
  }
}
