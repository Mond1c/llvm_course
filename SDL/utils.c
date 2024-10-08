#include <stdio.h>
#include <string.h>

#define LOG_BUFFER_SIZE 8192
#define MAX_LOGS 1000000

typedef struct {
    char buffer[LOG_BUFFER_SIZE];
    int bufferIndex;
    int logCount;
    const char* filename;
} LogData;

void logInstructionInternal(LogData *logData, const char* instruction) {
    if (logData->logCount >= MAX_LOGS) {
        return;
    }

    int len = strlen(instruction);

    if (logData->bufferIndex + len + 1 >= LOG_BUFFER_SIZE) {
        FILE *logFile = fopen(logData->filename, "a");
        if (logFile != NULL) {
            fwrite(logData->buffer, 1, logData->bufferIndex, logFile);
            fclose(logFile);
        }
        logData->bufferIndex = 0;
    }

    strcpy(&logData->buffer[logData->bufferIndex], instruction);
    logData->bufferIndex += len;

    logData->buffer[logData->bufferIndex++] = '\n';
    logData->logCount++;

    if (logData->logCount % 1000 == 0) {
        printf("[INSTRUCTION LOGGING] COUNT: %d\n", logData->logCount);
    }
}

void logInstruction(const char* instruction) {
    static LogData instructionLog = { .bufferIndex = 0, .logCount = 0, .filename = "instructions.log" };
    logInstructionInternal(&instructionLog, instruction);
}

void logUsageInstruction(const char* instruction) {
    static LogData usageLog = { .bufferIndex = 0, .logCount = 0, .filename = "instructions_uses.log" };
    logInstructionInternal(&usageLog, instruction);
}