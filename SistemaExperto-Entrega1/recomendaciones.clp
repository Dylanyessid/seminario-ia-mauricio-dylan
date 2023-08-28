(deffunction sugerir_carreras (?puntos ?interes)
    (bind ?textoFinal "Te sugerimos: ")
    (printout t ?puntos crlf)
     
    (printout t ?textoFinal)
)

(defrule pregunta-interes
   =>
   
   (printout t "¡Bienvenido al sistema experto de recomendación de sugerir_carreras!" crlf)
   (printout t "Por favor responda algunas preguntas para recibir una recomendación." crlf)
   (printout t "¿Cuál es su area de interes? (Matematicas / Moda / Tecnologia / Química / Lenguas / Historia)" crlf)
   (bind ?interes (read))
   (assert (area-interes ?interes)))

;;;Cuestionario Matemáticas



(defrule recomendacion-Matematicas
   (area-interes Matematicas)
   =>
   (bind ?puntos 0) 
   (printout t "¿Consideras que las matemáticas son utiles en situaciones cotidianas? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has participado en competencias matematicas? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Encuentras interesante la geometria? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Conoces a Euclides, uno de los padres de la geometria? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Crees que las matemáticas son esenciales para el avance científico? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Te sientes cómodo resolviendo problemas matemáticos complejos? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Encuentras la estadística y el análisis de datos interesantes? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

 
    (printout t "¿Conoces el teorema de Pitágoras en relación con triángulos rectángulos? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (sugerir_carreras ?puntos "Matematicas")
)

(defrule recomendacion-Moda
   (area-interes Moda)
   =>
   (bind ?puntos 0) 
   (printout t "¿Te atraen las tendencias de moda actuales? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Sigues a diseñadores de moda en redes sociales? (si/No) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has asistido a desfiles de moda en el pasado? (si/No)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Crees que la moda puede ser una forma de expresión personal? (si/No)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has asistido a alguna exposición de moda en un museo? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Sigues blogs de moda para inspirarte en tus looks? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has probado alguna vez el servicio de suscripción de ropa? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

     (bind ?respuesta-num -1)
   (while (not (and (integerp ?respuesta-num) (<= 1 ?respuesta-num 5)))
      (printout t "¿Qué tanto te gusta la vestimenta contemporánea? (Respuesta numérica del 1 al 5). 1 es nada, 5 es mucho" crlf)
      (bind ?respuesta-num (read))
      (if (not (and (integerp ?respuesta-num) (<= 1 ?respuesta-num 5)))
         then
         (printout t "Respuesta no válida. Por favor, ingresa un número entre 1 y 5." crlf)))

   (bind ?puntos (+ ?puntos ?respuesta-num))

   (printout t "Total de puntos obtenidos: " ?puntos crlf)
   (sugerir_carreras ?puntos "Moda")
)


(defrule recomendacion-Tecnologia
   (area-interes Tecnologia)
   =>
   (bind ?puntos 0) 
   (printout t "¿Sigues de cerca las últimas novedades tecnológicas?(si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Te interesa aprender a programar aplicaciones? (si/no) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Encuentras la inteligencia artificial fascinante?  (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has explorado la realidad virtual alguna vez? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Te emociona la idea de los vehículos autónomos?(si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
   
   (printout t "¿Tienes experiencia en el uso de asistentes virtuales como Siri o Alexa?(si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Te sientes intrigado por la criptomoneda y la tecnología blockchain?(si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has utilizado la realidad aumentada en aplicaciones o juegos?(si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    (sugerir_carreras ?puntos "Tecnologia")

)

(defrule recomendacion-Química
   (area-interes Química)
   =>
   (bind ?puntos 0) 
   (printout t "Te preguntas sobre los ingredientes de los productos que usas? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Has realizado experimentos de química por diversión? (si/No) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Encuentras la química orgánica intrigante?  (si/No)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Conoces algún compuesto químico común como el agua o el oxígeno? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has realizado experimentos químicos en un laboratorio escolar? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
   
   (printout t "¿Te interesa la química medicinal y el desarrollo de nuevos fármacos? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1)))

     (printout t "¿Sabes cómo se forma una molécula de agua? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

    (printout t "¿Has oído hablar del concepto de pH en relación con sustancias ácidas y básicas? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    
     (sugerir_carreras ?puntos "Quimica")
)

(defrule recomendacion-Lenguas
   (area-interes Lenguas)
   =>
   (bind ?puntos 0) 
   (printout t "¿Te gustaría aprender un nuevo idioma en algún momento?  (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Has viajado a un país donde se hable un idioma diferente al tuyo?  (si/No) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Encuentras fascinante la evolución de los idiomas a lo largo del tiempo?  (si/No)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Te interesaría estudiar la estructura gramatical de los idiomas? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Has tenido la oportunidad de practicar un idioma extranjero en un país donde se hable? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   
   (printout t "Si has tenido esa experiencia, te ha gustado? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Has utilizado aplicaciones de aprendizaje de idiomas, como Duolingo? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Si la has usado, te ha gustado? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    
     (sugerir_carreras ?puntos "Lenguas")
)

(defrule recomendacion-Historia
   (area-interes Historia)
   =>
   (bind ?puntos 0) 
   (printout t "¿Sientes curiosidad por épocas históricas específicas?  (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "  ¿Prefieres la historia política a la cultural en tus lecturas?   (si/No) ")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Has leído algún libro histórico en el último año?  (si/No)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Crees que entender la historia puede ofrecer lecciones para el presente? (si/No)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

    (printout t "¿Te interesan más las biografías históricas o los relatos de eventos? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has visitado algún sitio histórico importante, como un castillo o una ruina antigua? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Disfrutas viendo documentales históricos en tu tiempo libre? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Te atrae la historia de civilizaciones antiguas como la egipcia o la romana? (si/no)")
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    
    (sugerir_carreras ?puntos "Historia")
)

