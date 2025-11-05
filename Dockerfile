# # Use the official LibreTranslate image
# FROM libretranslate/libretranslate:latest

# # Expose the port that LibreTranslate runs on
# EXPOSE 5000

# # Environment variables (same as in docker-compose.yml)
# # ENV LT_API_KEYS=True
# # ENV LT_API_KEYS_DB_PATH=/app/db/api_keys.db
# # ENV LT_REQ_LIMIT=120
# ENV LT_UPDATE_MODELS=True
# ENV LT_DEBUG=True

# # Start LibreTranslate on the expected port
# CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]

FROM python:3.11-slim

WORKDIR /app

# Copy repo
COPY . /app

# Install dependencies
RUN pip install poetry
RUN poetry install --no-root

# Expose port
EXPOSE 5000

# Start command
CMD ["python", "-m", "libretranslate", "--host", "0.0.0.0", "--port", "5000"]

