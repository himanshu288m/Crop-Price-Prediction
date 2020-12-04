from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
from flask_restful import reqparse
import json
import pickle as p
from sklearn.preprocessing import StandardScaler

app = Flask(__name__)


@app.route("/", methods=['GET'])
def hello():
    return "hey"


@app.route('/predict', methods=['POST'])
def predict():

        try:
            data = request.get_json()
            modelfile = 'Xgmodel.pickle'
            model = p.load(open(modelfile,'rb'))
            print(model)
            scaler = StandardScaler()
            scaler.fit(data)
            prediction = np.array2string(model.predict(data))
            return jsonify({'prediction': prediction})

        except:
            return jsonify({'trace': traceback.format_exc()})



if __name__ == '__main__':
    
    app.run(debug=True)



