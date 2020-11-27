from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
from flask_restful import reqparse
import json
import pickle as p

app = Flask(__name__)


@app.route("/", methods=['GET'])
def hello():
    return "hey"


@app.route('/predict', methods=['POST'])
def predict():

        try:
            data = request.get_json()

            prediction = np.array2string(model.predict(data))

            return jsonify({'prediction': prediction})

        except:
            return jsonify({'trace': traceback.format_exc()})



if __name__ == '__main__':
    modelfile = 'Xgmodel.pickle'
    model = p.load(open(modelfile,'rb'))
    print(model)
    app.run(debug=True)



