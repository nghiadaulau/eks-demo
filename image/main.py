from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello AWS Community Day 2025!'

@app.route('/health')
def health():
    return {'status': 'healthy'}, 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
