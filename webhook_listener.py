from flask import Flask, request
import subprocess
import os

app = Flask(__name__)

REPO_PATH = os.path.dirname(os.path.abspath(__file__))  # Root directory of your repo

@app.route('/webhook', methods=['POST'])
def webhook():
    try:
        # Pull the latest changes
        subprocess.call(['./deploy.sh'], cwd=REPO_PATH)
        return 'Deployment successful!', 200
    except Exception as e:
        return f"Error: {str(e)}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Expose the Flask app on port 5000
