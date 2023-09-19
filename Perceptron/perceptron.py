import numpy as np

# Softmax ya que este perceptrón es multicategoría
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

# Conjunto de datos de entrenamiento (ejemplos etiquetados). Se pueden agregar más para una mayor precisión
training_data = [
    # Se clasifican los libros dependiendo de los valores de las siguientes variables:
        # Intimidad y relaciones personales
        # Nivel de tensión o miedo
        # Elementos de misterio o enigma
        # Presencia de humor
        # Nivel de acción y adrenalina
        # Dinámica de personajes
        # Tono y atmósfera general
        # Resolución de conflictos
        # Presencia de elementos sobrenaturales
        # Diversidad de escenarios
    {"features": [5, 3, 2, 3, 1, 4 ,5, 4, 2, 4], "label": 0},  # Romance
    {"features": [5, 3, 3, 4, 2, 5 ,4, 4, 2, 3], "label": 0},
    {"features": [4, 4, 3, 5, 3, 5 ,3, 4, 2, 3], "label": 0},
    {"features": [5, 3, 3, 5, 3, 4 ,3, 4, 2, 5], "label": 0},
    {"features": [4, 2, 3, 4, 1, 5 ,3, 4, 2, 4], "label": 0},

    {"features": [3, 5, 5, 3, 5, 3, 4, 4, 5, 3], "label": 1},  # Terror
    {"features": [3, 4, 4, 3, 5, 3, 5, 2, 4, 4], "label": 1},
    {"features": [3, 5, 4, 4, 4, 3, 4, 2, 5, 4], "label": 1},
    {"features": [4, 4, 4, 4, 4, 3, 4, 4, 5, 4], "label": 1},
    {"features": [2, 5, 5, 4, 5, 3, 4, 2, 5, 4], "label": 1},

    {"features": [3, 3, 5, 2, 3, 3, 4, 3, 3, 3], "label": 2},  # Misterio
    {"features": [2, 3, 5, 2, 3, 3, 4, 4, 3, 4], "label": 2},
    {"features": [3, 1, 5, 2, 3, 3, 4, 3, 3, 3], "label": 2},
    {"features": [4, 2, 5, 2, 3, 3, 4, 3, 3, 4], "label": 2},
    {"features": [3, 3, 5, 2, 3, 3, 4, 5, 3, 5], "label": 2},
    {"features": [5, 1, 5, 2, 3, 3, 4, 4, 3, 4], "label": 2},

    {"features": [3, 4, 2, 5, 1, 3, 2, 4, 2, 2], "label": 3},
    {"features": [5, 4, 2, 4, 1, 3, 2, 5, 2, 3], "label": 3},
    {"features": [1, 3, 2, 4, 1, 4, 2, 4, 2, 4], "label": 3},
    {"features": [4, 2, 2, 3, 1, 3, 2, 5, 2, 3], "label": 3},
    {"features": [2, 1, 2, 5, 1, 3, 2, 4, 2, 2], "label": 3},  # Comedia


    {"features": [2, 2, 3, 3, 4, 5, 3, 5, 3, 4], "label": 4},
    {"features": [3, 2, 4, 3, 4, 4, 3, 3, 3, 5], "label": 4},
    {"features": [4, 1, 2, 3, 4, 5, 3, 5, 3, 5], "label": 4},
    {"features": [5, 1, 4, 3, 4, 4, 3, 4, 3, 4], "label": 4},
    {"features": [3, 1, 5, 3, 4, 3, 3, 4, 3, 5], "label": 4},   # Acción
]

# Parámetros de entrenamiento
learning_rate = 0.1
epochs = 100

# Entrenar el perceptrón
trained_weights, trained_bias = train_perceptron(training_data, learning_rate, epochs)

# Ejemplo de clasificación de un libro
print("Este es un clasificador de libros realizado por medio de un perceptrón, el cual clasificará el libro ingresado por medio de preguntas sobre las características de la historia o trama del libro.\n")
book_name = input("Bienvenido al clasificador de libros. Ingresa el nombre del libro por favor: ")
print("Por favor, ingresa la siguiente información en una escala del 1 al 5 (1 significa poca presencia o sensación del aspecto preguntado, 5 es mucha presencia o sensación del aspecto preguntado): \n")

#Usamos try except para controlar entradas no enteras y while para controlar los valores fuera de los rangos
try:
    intimacy = int(input("Intimidad y relaciones personales: "))
    while(intimacy<1 or intimacy>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        intimacy = int(input("Intimidad y relaciones personales: "))

    tension = int(input("Nivel de tensión o miedo: "))
    while(tension<1 or tension>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        tension = int(input("Nivel de tensión o miedo: "))
    
    mystery = int(input("Elementos de misterio o enigma: "))
    while(mystery<1 or mystery>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        mystery = int(input("Elementos de misterio o enigma: "))
        
    humor = int(input("Presencia de humor: "))
    while(humor<1 or humor>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        humor = int(input("Presencia de humor: "))

    action = int(input("Nivel de acción y adrenalina: "))
    while(action<1 or action>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        action = int(input("Nivel de acción y adrenalina: "))

    character_dynamic = int(input("Dinámica de personajes: "))
    while(character_dynamic<1 or character_dynamic>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        character_dynamic = int(input("Dinámica de personajes: "))

    tone = int(input("Tono y atmósfera general: "))
    while(tone<1 or tone>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        tone = int(input("Tono y atmósfera general: "))

    conflict_resolution = int(input("Resolución de conflictos en la historia: "))
    while(conflict_resolution<1 or conflict_resolution>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        conflict_resolution = int(input("Resolución de conflictos en la historia: "))

    supernatural = int(input("Presencia de elementos sobrenaturales: "))
    while(supernatural<1 or supernatural>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        supernatural = int(input("Presencia de elementos sobrenaturales: "))
    diversity = int(input("Diversidad de escenarios en la historia: "))
    while(diversity<1 or diversity>5):
        print("Rango NO VÁLIDO. Debe ser entre 1 y 5")
        diversity = int(input("Diversidad de escenarios en la historia: "))

    
    book_features = np.array([intimacy, tension, mystery, humor, action, character_dynamic, tone, conflict_resolution, supernatural, diversity])
    predicted_category = classify_book(book_features, trained_weights, trained_bias)

    # Mapeo de categorías a nombres
    category_names = ["Romance", "Terror", "Misterio", "Comedia", "Acción"]
    predicted_category_name = category_names[predicted_category]

    print(f"\nEl libro de nombre {book_name} se clasifica en la categoría: {predicted_category_name}")
   
except:
    print("\nValor no válido. Debe ser el número ENTERO y entre 1 y 5 positivo. Tendrás que volver a ejecutar el programa")


