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
            mean_ = np.array([2.01891029e+03, 6.38522427e+00, 1.97889182e-01, 1.82058047e-01,
                            1.82058047e-01, 1.63588391e-01, 2.74406332e-01, 7.91556728e-03,
                            8.97097625e-02, 2.90237467e-02, 7.38786280e-02, 8.44327177e-02,
                            2.63852243e-03, 8.97097625e-02, 8.17941953e-02, 4.48548813e-01,
                            2.63852243e-03, 8.97097625e-02])
            var_ = np.sqrt(np.array([6.25197541e-01, 1.13397289e+01, 1.58729054e-01, 1.48912915e-01,
                           1.48912915e-01, 1.36827229e-01, 1.99107497e-01, 7.85291108e-03,
                           8.16619210e-02, 2.81813688e-02, 6.84205763e-02, 7.73038339e-02,
                           2.63156063e-03, 8.16619210e-02, 7.51039049e-02, 2.47352775e-01,
                           2.63156063e-03, 8.16619210e-02]))
            mean_d = np.subtract(data,mean_)

            norm_ = np.divide(mean_d,var_)
            

        
            prediction = np.array2string(model.predict(norm_))
            return jsonify({'prediction': prediction})

        except:
            return jsonify({'trace': traceback.format_exc()})



if __name__ == '__main__':
    
    app.run(debug=True)



