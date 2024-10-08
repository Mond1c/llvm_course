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

static char logBuffer2[LOG_BUFFER_SIZE];
static int logBufferIndex2 = 0;
static int logCount2 = 0;

void logUsageInstruction(const char* instruction) {
    if (logCount2 >= MAX_LOGS) {
        return;
    }

    int len = strlen(instruction);

    if (logBufferIndex2 + len + 1 >= LOG_BUFFER_SIZE) {
        FILE *logFile = fopen("instructions_uses.log", "a");
        if (logFile != NULL) {
            fwrite(logBuffer2, 1, logBufferIndex2, logFile);
            fclose(logFile);
        }
        logBufferIndex2 = 0;
    }

    strcpy(&logBuffer2[logBufferIndex2], instruction);
    logBufferIndex2 += len;

    logBuffer2[logBufferIndex2++] = '\n';
    logCount2++;

    if (logCount2 % 1000 == 0) {
        printf("[INSTRUCTION LOGGING] COUNT: %d\n", logCount2);
    }
}

