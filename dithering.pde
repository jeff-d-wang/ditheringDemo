PImage jeff;

/*
Dithering is quantizing an image: reducing the color possibilities.
I will convert each RGB value to 8 possibilities.
Red will either be 0 or 255.
Green will either be 0 or 255.
Blue will either be 0 or 255.
But I will do much more to create a nice, beautiful affect.
*/

void setup() {
  size(960, 480);
  jeff = loadImage("jeff.jpg");
  // jeff.filter(GRAY);
  image(jeff, 0, 0);
}

void draw() {
  jeff.loadPixels();
  for (int x = 0; x < jeff.width; x++) {
    for (int y = 0; y < jeff.height; y++) {
      int i = x + y * jeff.width;
      color pix = jeff.pixels[i];
      
      float r = red(pix);
      float g = green(pix);
      float b = blue(pix);
      
      r = round(4 * r / 255) * (255 / 10);
      g = round(4 * g / 255) * (255 / 10);
      b = round(4 * b / 255) * (255 / 10);
      
      jeff.pixels[i] = color(r, g, b);
    }
  }
  jeff.updatePixels();
  image(jeff, 960, 0);
} 
