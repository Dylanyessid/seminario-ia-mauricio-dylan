import clips



def main():

    historyPoints:int = 0
    mathPoints:int = 0
    languagePoints:int = 0
    chemicalPoints:int = 0
    tecnologyPoints:int = 0
    fashionPoint:int = 0
    

    print("Hola, bienvenido a nuestro sistema de asesoría. Vamos a hacer unas preguntas pertinentes a diferentes áreas de conocimiento para poder sugerir una carrera universitaroa. Si bien son sugerencias, te recomendamos que sigas explorando de dichas carreras")
    #input("")
    env = clips.Environment()
    factsList = list()

    factsList.append(env.assert_string('(question si)'))
    factsList.append(env.assert_string('(question no)'))

    
    
    print(factsList[1][0])
    env.run()
#     test = """ (deftemplate person
#   (slot name (type STRING))
#   (slot surname (type STRING))
#   (slot birthdate (type SYMBOL)))"""
#     env = clips.Environment()
#     env.build(test)
#     env.run()
   
main()