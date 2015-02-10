#include "SDL2/SDL.h"
#include "vector.h"
#include <cmath>
#include <cstdio>

SDL_Window* window;
SDL_Renderer* renderer;

bool done = false;

void init()
{
  SDL_Init(SDL_INIT_EVERYTHING);
  window = SDL_CreateWindow("Herp Derp", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800, 600, SDL_WINDOW_SHOWN);
  renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
  
  // Set icon to window
  SDL_Surface* surface;
  SDL_RWops *rwop;
  rwop = SDL_RWFromFile("icon.ico", "rb");
  surface = IMG_LoadICO_RW(rwop);
  SDL_SetWindowIcon(window, surface);
  SDL_FreeSurface(surface);

  Vector a(12, 55, M_PI);
  Vector b(33, 24);
  Vector v = a + b;

  printf("Vector x:%f, y:%f, angle:%.16f\n", v.x, v.y, v.angle);
}

void update()
{
  SDL_Event event;

  while (SDL_PollEvent(&event)) {
    if (event.type == SDL_QUIT) {
      done = true;
    }
  }
}

void clean()
{
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);

  SDL_Quit();
}

void loop()
{
  while (!done) {
    update();
  }

  std::printf("Exiting");

  clean();
}

int main(int argc, char* args[])
{
  init();
  loop();

  return 0;
}
