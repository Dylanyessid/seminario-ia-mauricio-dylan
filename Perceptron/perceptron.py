import numpy as np

# Función de activación (en este caso, softmax para clasificación multicategórica)
def softmax(x):
    e_x = np.exp(x - np.max(x))  # Resta el máximo para evitar problemas numéricos
    return e_x / e_x.sum(axis=0)

# Función para entrenar el perceptrón
def train_perceptron(training_data, learning_rate, epochs):
    # Inicialización de pesos y sesgo
    num_features = len(training_data[0]["features"])
    num_categories = len(set([example["label"] for example in training_data]))
    weights = np.random.rand(num_categories, num_features)
    bias = np.random.rand(num_categories)
    
    for epoch in range(epochs):
        for example in training_data:
            # Características y etiqueta del ejemplo
            features = np.array(example["features"])
            label = example["label"]
            
            # Cálculo de la suma ponderada + sesgo
            weighted_sum = np.dot(weights, features) + bias
            
            # Aplicar softmax para obtener probabilidades
            probabilities = softmax(weighted_sum)
            
            # Índice de la categoría predicha
            predicted_category = np.argmax(probabilities)
            
            # Actualizar pesos y sesgo mediante el descenso del gradiente
            if predicted_category != label:
                weights[label] += learning_rate * features
                weights[predicted_category] -= learning_rate * features
                bias[label] += learning_rate
                bias[predicted_category] -= learning_rate
    
    return weights, bias

# Función para clasificar un libro en una categoría
def classify_book(features, weights, bias):
    weighted_sum = np.dot(weights, features) + bias
    probabilities = softmax(weighted_sum)
    predicted_category = np.argmax(probabilities)
    return predicted_category

# Conjunto de datos de entrenamiento (ejemplos etiquetados)
training_data = [
    #Intimidad y relaciones personales
    # Nivel de tensión o miedo
    # Elementos de misterio o enigma: 1
    # Presencia de humor: 1
    # Nivel de acción y adrenalina: 1
    # Dinámica de personajes: 1
    # Tono y atmósfera general: 1
    # Resolución de conflictos: 1
    # Presencia de elementos sobrenaturales: 1
    # Diversidad de escenarios: 1
    {"features": [5, 3, 2, 3, 1, 4 ,5, 4, 2,4], "label": 0},  # Romance
    {"features": [3, 5, 5, 3, 5, 3, 4, 4, 5, 3], "label": 1},  # Terror
    {"features": [3, 4, 5, 2, 3, 3, 4, 3, 3, 2], "label": 2},  # Misterio
    {"features": [2, 5, 2, 5, 1, 3, 2, 4, 2, 3], "label": 3},  # Comedia
    {"features": [2, 3, 3, 3, 4, 4, 3, 3, 3, 4], "label": 4}   # Acción
]

# Parámetros de entrenamiento
learning_rate = 0.1
epochs = 100

# Entrenar el perceptrón
trained_weights, trained_bias = train_perceptron(training_data, learning_rate, epochs)

# Ejemplo de clasificación de un libro
print("Bienvenido al clasificador de libros. Por favor, ingresa la siguiente información en una escala del 1 al 5:")
intimacy = int(input("Intimidad y relaciones personales: "))
tension = int(input("Nivel de tensión o miedo: "))
mystery = int(input("Elementos de misterio o enigma: "))
humor = int(input("Presencia de humor: "))
action = int(input("Nivel de acción y adrenalina: "))
character_dynamic = int(input("Dinámica de personajes: "))
tone = int(input("Tono y atmósfera general: "))
conflict_resolution = int(input("Resolución de conflictos: "))
supernatural = int(input("Presencia de elementos sobrenaturales: "))
diversity = int(input("Diversidad de escenarios: "))

book_features = np.array([intimacy, tension, mystery, humor, action, character_dynamic, tone, conflict_resolution, supernatural, diversity])
predicted_category = classify_book(book_features, trained_weights, trained_bias)

# Mapeo de categorías a nombres
category_names = ["Romance", "Terror", "Misterio", "Comedia", "Acción"]
predicted_category_name = category_names[predicted_category]

print(f"El libro se clasifica en la categoría: {predicted_category_name}")
