import numpy as np

# Ejemplo de características de texto (esto debe ser reemplazado por un conjunto de datos real)
text_features = [
    "Me siento muy feliz",
    "Esto es terrible",
    "Me encanta este lugar",
    "Estoy triste",
    "Es un día normal"
]

# Etiquetas correspondientes a las emociones (1 para positivo, -1 para negativo, 0 para neutral)
labels = [1, -1, 1, -1, 0]

# Función para extraer características de texto flexibles (cuenta de palabras)
def extract_features(text):
    words = text.lower().split()  # Convertir a minúsculas y dividir por palabras
    features = {}
    for word in words:
        features[word] = features.get(word, 0) + 1
    return features

# Extraer características de texto para cada ejemplo
X = [extract_features(text) for text in text_features]

# Crear una lista de palabras únicas a partir de las características extraídas
unique_words = set()
for example in X:
    unique_words.update(example.keys())
unique_words = list(unique_words)

# Convertir características en una matriz numpy
X = np.array([[example.get(word, 0) for word in unique_words] for example in X])

# Definir el perceptrón
class Perceptron:
    def __init__(self, num_features):
        self.weights = np.zeros(num_features)
        self.bias = 0.0

    def predict(self, x):
        return 1 if np.dot(self.weights, x) + self.bias > 0 else -1 if np.dot(self.weights, x) + self.bias < 0 else 0

    def train(self, X, y, learning_rate=0.1, epochs=100):
        for _ in range(epochs):
            for i in range(len(X)):
                y_pred = self.predict(X[i])
                self.weights += learning_rate * (y[i] - y_pred) * X[i]
                self.bias += learning_rate * (y[i] - y_pred)

# Inicializar y entrenar el perceptrón
num_features = len(X[0])
perceptron = Perceptron(num_features)
perceptron.train(X, labels)

# Prueba de predicción
test_text = "Me encanta este lugar"
test_features = extract_features(test_text)
test_input = np.array([test_features.get(word, 0) for word in unique_words])
prediction = perceptron.predict(test_input)

if prediction == 1:
    print("La emoción es positiva.")
elif prediction == -1:
    print("La emoción es negativa.")
else:
    print("La emoción es neutral.")
