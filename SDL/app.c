#include "sim.h"
#include <stdio.h>

#define CELL_SIZE 2
#define BOARD_Y_SIZE SIM_Y_SIZE / CELL_SIZE
#define BOARD_X_SIZE SIM_X_SIZE / CELL_SIZE

int get_neigbours_count(int board[BOARD_Y_SIZE][BOARD_X_SIZE], int y, int x) {
  static const int dirs[8][2] = { {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1}, {0, -1}, {1, -1} };
  int count = 0;
  for (int i = 0; i < 8; i++) {
    int dy = y + dirs[i][0] < 0 ? y + dirs[i][0] + BOARD_Y_SIZE : (y + dirs[i][0]) % BOARD_Y_SIZE;
    int dx = x + dirs[i][1] < 0 ? x + dirs[i][1] + BOARD_X_SIZE : (x + dirs[i][1]) % BOARD_X_SIZE;
    if (board[dy][dx]) {
      ++count;
    }
  }
  return count;
}

void draw_cell(int y, int x, int argb) {
  for (int dy = 0; dy < CELL_SIZE; ++dy) {
    for (int dx = 0; dx < CELL_SIZE; ++dx) {
      simPutPixel(x * CELL_SIZE + dx, y * CELL_SIZE + dy, argb);
    }
  }
}

void app() {
  int board_last[BOARD_Y_SIZE][BOARD_X_SIZE] = {{ 0 }};
  int board[BOARD_Y_SIZE][BOARD_X_SIZE] = {{ 0 }};
  printf("%d, %d\n", BOARD_Y_SIZE, BOARD_X_SIZE);

  for (int y = 0; y < BOARD_Y_SIZE; ++y) {
    for (int x = 0; x < BOARD_X_SIZE; ++x) {
      if (simRand() % 10 == 0) {
        board_last[y][x] = 1;
      }
    }
  }

  while (1) {
    for (int y = 0; y < BOARD_Y_SIZE; ++y) {
      for (int x = 0; x < BOARD_X_SIZE; ++x) {
        int neighbours = get_neigbours_count(board_last, y, x);
        if (board[y][x]) {
          if (neighbours != 2 && neighbours != 3) {
            board[y][x] = 0;
          } else {
            board[y][x] = 1;
          }
        } else if (neighbours == 3) {
          board[y][x] = 1;
        } else {
          board[y][x] = 0;
        }
        if (board[y][x]) {
          draw_cell(y, x, 0xFFF);
        } else {
          draw_cell(y, x, 0x000);
        }
      }
    }
    simFlush();
    for (int y = 0; y < BOARD_Y_SIZE; ++y) {
      for (int x = 0; x < BOARD_X_SIZE; ++x) {
        board_last[y][x] = board[y][x];
      }
    }
  }
}