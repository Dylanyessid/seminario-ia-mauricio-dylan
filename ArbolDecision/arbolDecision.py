#Librerías necesarias
import pandas as pd
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeClassifier, plot_tree
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn import tree
import matplotlib.pyplot as plt
import easygui


# Importa los datos .csv
numeric_variables = ['Age', 'Annual Income ($)', 'Family Size']
col_names = ['Age', 'Annual Income ($)', 'Family Size']
data = pd.read_csv("Customers.csv")

data = data.drop(["CustomerID","Profession","Work Experience", "Gender"], axis=1)

#Escalamos los valores numéricos con MinMax
scaler = MinMaxScaler()
data[numeric_variables] = scaler.fit_transform(data[numeric_variables])

#Sacamos las variables.
x = data.drop(columns=["Spending Score (1-100)"])
y = data['Spending Score (1-100)']

variables = ["Edad", "Ingreso anual en pesos colombianos($)", "Tamaño de la familia"] 

model = DecisionTreeClassifier()

try:
  X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.3, random_state=43)
  model.fit(X_train, y_train)

  ##Estas dos líneas comentadas son las que muestra el diagrama de arbol.
  #fig, ax = plt.subplots(figsize=(12, 8))
  #tree.plot_tree(model, feature_names=col_names, class_names=True, filled=True, rounded=True, ax=ax, fontsize=10)

  y_pred = model.predict(X_test)

  values = []


  print("Bienvenido al sistema de puntaje. Vamos a predecir el Spending Score, la cual es una medida numérica de 1 a 100, que mide su comportamiento de gastos y compras, lo que puede ayudar a las empresas en sus diferentes estrategias de marketing o publicidad. Esta medida las vamos a calcular con respecto a 3 datos que te pediremos. Por favor ingrésalos. :)\n")


  #Preguntar las variables a ingresar
  values.append(int(input("Ingrese el valor de la edad del cliente (Mínimo 13 años, máximo 100): " )))

  values.append(float(input("\nIngrese el valor del ingreso anual del cliente en pesos colombianos: " )))

  values.append(int(input("\nIngrese el número de integrantes en la familia del cliente: " )))

  #Predecir el valor que tendrá
  entry = pd.DataFrame([values],columns=col_names)
  prediccion = model.predict(entry)
  print(f'El valor del Spending Score es: {prediccion[0]}')
  
  #Mostrar gráficas.
  plt.figure(figsize=(10, 6))
  plt.title("Predicción Resultado ingresado por usuario comparado con Datos reales")
  plt.scatter(range(len(y)), y, label='Etiquetas reales', color='blue', marker='o', alpha=0.5)
  plt.scatter(range(len(prediccion)), prediccion, label='Prediccion', color='red', marker='x', alpha=0.5)
  plt.xlabel('Valores de Edad, Ingresos mensuales, Tamaño de familia')
  plt.ylabel('Spending Score')
  plt.show()


  plt.figure(figsize=(10, 6))
  plt.title("Predicción de datos de prueba comparado con Datos reales")
  plt.scatter(range(len(y)), y, label='Etiquetas reales', color='blue', marker='o', alpha=0.5)
  plt.scatter(range(len(y_pred)), y_pred, label='Predicciones', color='red', marker='x', alpha=0.5)
  plt.xlabel('Valores de Edad, Ingresos mensuales, Tamaño de familia')
  plt.ylabel('Spending Score ')
  #plt.legend(f'Precisión del modelo: {accuracy * 100}%')
  plt.show()

  fig = plt.figure(figsize=(10, 8))
  ax = fig.add_subplot(111, projection='3d')
  ax.scatter(X_test['Age'], X_test['Annual Income ($)'], X_test['Family Size'], c=y_pred, cmap='viridis')
  ax.set_xlabel('Age')
  ax.set_ylabel('Annual Income ($)')
  ax.set_zlabel('Family Size')
  ax.set_title('Agrupamiento de Datos según Predicciones del Árbol de Decisiones')
  plt.show()
except Exception as e:
    print("Ocurrió un error. Saliendo del programa, ejecútelo otra vez. Descripción de error (para los desarrolladores):" + str(e))
