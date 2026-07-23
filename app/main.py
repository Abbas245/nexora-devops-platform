import logging
import os

from flask import Flask, jsonify

app = Flask(__name__)

app_env = os.getenv("APP_ENV", "development")
app_version = os.getenv("APP_VERSION", "0.1.0")
debug_mode = app_env == "development"

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
    filename="logs/application.log"
)


@app.route("/")
def home():
    logging.info("Home endpoint accessed")
    return "Welcome to Nexora DevOps Platform"


@app.route("/health")
def health():
    logging.info("Health endpoint accessed")
    return jsonify({
        "status": "healthy",
        "environment": app_env,
        "version": app_version
    })


if __name__ == "__main__":
    logging.info(
        "Starting application in %s environment",
        app_env
    )
    app.run(debug=debug_mode)
