#include "sim.h"

#define RANDOM_GENERATION 5

int get_neigbours_count(char board[SIM_Y_SIZE][SIM_X_SIZE], int y, int x) {
  static const int dirs[8][2] = {{1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1}, {0, -1}, {1, -1}};
  int count = 0;
  for (int i = 0; i < 8; i++) {
    int dy = y + dirs[i][0] < 0 ? y + dirs[i][0] + SIM_Y_SIZE
                                : (y + dirs[i][0]) % SIM_Y_SIZE;
    int dx = x + dirs[i][1] < 0 ? x + dirs[i][1] + SIM_X_SIZE
                                : (x + dirs[i][1]) % SIM_X_SIZE;
    if (board[dy][dx]) {
      ++count;
    }
  }
  return count;
}

void init_zero_frame(char board_last[SIM_Y_SIZE][SIM_X_SIZE]) {
  for (int y = 0; y < SIM_Y_SIZE; ++y) {
    for (int x = 0; x < SIM_X_SIZE; ++x) {
      if (simRand() % RANDOM_GENERATION == 0) {
        board_last[y][x] = 1;
      }
    }
  }
}

void calculate_and_draw_frame(char board_last[SIM_Y_SIZE][SIM_X_SIZE], char board[SIM_Y_SIZE][SIM_X_SIZE]) {
  for (int y = 0; y < SIM_Y_SIZE; ++y) {
    for (int x = 0; x < SIM_X_SIZE; ++x) {
      int neighbours = get_neigbours_count(board_last, y, x);
      if (board[y][x]) {
        if (neighbours != 2 && neighbours != 3) {
          board[y][x] = 0;
        }
        else {
          board[y][x] = 1;
        }
      } else if (neighbours == 3) {
        board[y][x] = 1;
      } else {
        board[y][x] = 0;
      }

      if (board[y][x]) {
        simPutPixel(x, y, 0x00FF00);
      } else {
        simPutPixel(x, y, 0);
      }
    }
  }
}

void app() {
  char board_last[SIM_Y_SIZE][SIM_X_SIZE] = {{0}};
  char board[SIM_Y_SIZE][SIM_X_SIZE] = {{0}};

  init_zero_frame(board_last);

  int running = 1;
  int is_not_empty_board = 1;

  while (running && is_not_empty_board) {
    
    calculate_and_draw_frame(board_last, board);
    simFlush();

    running = 0;
    is_not_empty_board = 0;
    for (int y = 0; y < SIM_Y_SIZE; ++y) {
      for (int x = 0; x < SIM_X_SIZE; ++x) {
        if (board_last[y][x] != board[y][x]) {
          running = 1;
        }
        if (board[y][x] != 0) {
          is_not_empty_board = 1;
        }
        board_last[y][x] = board[y][x];
      }
    }
  }
}
