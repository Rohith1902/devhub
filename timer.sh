
#!/bin/bash

LOG_DIR="/mnt/Apps/My-Bin/project-timer"

start_timer() {
    PROJECT_NAME="$1"

    if [[ -z "$PROJECT_NAME" ]]; then
        echo "Error: Project name required."
        return 1
    fi

    mkdir -p "$LOG_DIR"

    START_TIME=$(date +%s)
    START_DATE=$(date '+%Y-%m-%d %H:%M:%S')

    echo "Timer started for: $PROJECT_NAME"
    echo "Started at: $START_DATE"
}

stop_timer() {
    if [[ -z "$START_TIME" || -z "$PROJECT_NAME" ]]; then
        echo "Error: Timer was not started."
        return 1
    fi

    END_TIME=$(date +%s)
    ELAPSED=$((END_TIME - START_TIME))

    printf '%s | %s | %s | %s seconds\n' \
        "$PROJECT_NAME" "$START_DATE" \
        "$(date '+%Y-%m-%d %H:%M:%S')" "$ELAPSED" \
        >> "$LOG_DIR/${PROJECT_NAME}.log"

    printf 'Time spent on %s: %02dh %02dm %02ds\n' \
        "$PROJECT_NAME" \
        "$((ELAPSED / 3600))" \
        "$(((ELAPSED % 3600) / 60))" \
        "$((ELAPSED % 60))"
}
