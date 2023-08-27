from clips import Environment
import sys

# -*- coding: utf-8 -*-

# Crea un entorno CLIPS
env = Environment()

# Carga las reglas desde el archivo
env.load("recomendaciones.clp")

# Ejecuta el sistema
env.reset()
env.run()


