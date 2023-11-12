#Conjunto de datos obtenidos desde: https://www.kaggle.com/datasets/priyanshusethi/happiness-classification-dataset
import tensorflow as tf
from tensorflow import keras
import pandas as pd
import matplotlib.pyplot as plt

#Leemos el archivo .csv y sacamos datos de entrada y etiquetas
datos_entrada = pd.read_csv("happydata.csv")
etiquetas = datos_entrada.get("happy")
datos_entrada = datos_entrada.drop("happy", axis=1)
datos_entrada = datos_entrada.values


#Funcionamiento app
print("En una escala de 1 a 5, evalúe las siguientes preguntas: ")

info = float(input("La información acerca de los servicios (médicos, entretenimiento, públicos, etc.) de la ciudad en la que reside\n"))

housing = float(input("El costo de alojamiento\n"))

school = float(input("La calidad de la educación en instituciones públicas\n"))

police =  float(input("La confianza que tiene en la policía de su ciudad\n"))

streets =  float(input("El mantenimiento a calles y andenes de su ciudad\n"))

events =  float(input("Disponibilidad de eventos sociales y/o comunitarios\n"))

#Definimos la red #2
modelo = keras.Sequential([
     keras.layers.Input(shape=(6,)),
     keras.layers.Dense(14,activation='linear'),
     keras.layers.Dense(14,activation='relu'),
     keras.layers.Dense(14,activation='linear'),
     keras.layers.Dense(14,activation='softmax'),
     keras.layers.Dense(14,activation='linear'),
     keras.layers.Dense(1,activation='sigmoid')
])
#Compilamos, entrenamos y evaluamos el modelo
modelo.compile(optimizer='adam',
               loss='binary_crossentropy',
               metrics=['accuracy'])

historial = modelo.fit(datos_entrada, etiquetas, epochs=1200,verbose=0)
loss, accuracy = modelo.evaluate(datos_entrada, etiquetas)

#Se predice usando Los datos ingresados por el usuario y se da la predicción
user_data = [info,housing,school,police,streets,events]
prediction = modelo.predict([user_data])

if(prediction[0][0]<0.5):
    print("Usted Vive Felíz")
else:
    print("Usted NO Vive Felíz")

#Impresión de gráficas sobre rendimiento
plt.xlabel("Número de Epoca")
plt.ylabel("Maginitud de Pérdida")
plt.plot(historial.history["loss"])
plt.show()


plt.xlabel("Número de Epoca")
plt.ylabel("Precisión")
plt.plot(historial.history["accuracy"])
plt.show()
