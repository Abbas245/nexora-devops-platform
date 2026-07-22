import os

from flask import Flask, jsonify

app = Flask(__name__)

app_env = os.getenv("APP_ENV", "development")
debug_mode = app_env == "development"

@app.route("/")
def home():
    return "Welcome to Nexora DevOps Platform"


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "environment": app_env
    })


if __name__ == "__main__":
    app.run(debug=debug_mode)
