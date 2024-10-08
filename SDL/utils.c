#include <stdio.h>
#include <string.h>

#define LOG_BUFFER_SIZE 8192
#define MAX_LOGS 1000000

static char logBuffer[LOG_BUFFER_SIZE];
static int logBufferIndex = 0;
static int logCount = 0;

void logInstruction(const char* instruction) {
    if (logCount >= MAX_LOGS) {
        return;
    }

    int len = strlen(instruction);

    if (logBufferIndex + len + 1 >= LOG_BUFFER_SIZE) {
        FILE *logFile = fopen("instructions.log", "a");
        if (logFile != NULL) {
            fwrite(logBuffer, 1, logBufferIndex, logFile);
            fclose(logFile);
        }
        logBufferIndex = 0;
    }

    strcpy(&logBuffer[logBufferIndex], instruction);
    logBufferIndex += len;

    logBuffer[logBufferIndex++] = '\n';
    logCount++;

    if (logCount % 1000 == 0) {
        printf("[INSTRUCTION LOGGING] COUNT: %d\n", logCount);
    }
}
