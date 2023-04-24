import os
import random
from flask import Flask, request


app = Flask(__name__)


@app.route('/greeting', methods=['GET'])
def greeting():
    name = request.args.get('name')
    return "Hello " + name


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
