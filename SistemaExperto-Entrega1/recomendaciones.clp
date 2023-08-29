
;;;Función que calcula con el sistema de puntajes qué carreras de qué área escogida pueda recomendar
(deffunction sugerir_carreras (?puntos ?materia)
    (printout t ?puntos crlf)
   (bind ?textoFinal "Te sugerimos: ")
   
   (if (eq ?materia "Matematicas")
       then
       (if (and (>= ?puntos 1) (< ?puntos 6))
            then
            (bind ?textoFinal (str-cat ?textoFinal "Ingeniería"))
         else
            (if (and (>= ?puntos 6) (< ?puntos 10))
                 then
                 (bind ?textoFinal (str-cat ?textoFinal "Ingeniería, Ciencias de la Computación"))
              else
                 (if (and (>= ?puntos 10) (< ?puntos 14))
                      then
                      (bind ?textoFinal (str-cat ?textoFinal "Ingeniería, Ciencias de la Computación, Estadística"))
                   else
                      (if (>= ?puntos 14)
                           then
                           (bind ?textoFinal (str-cat ?textoFinal "Ingeniería, Ciencias de la Computación, Estadística, Física"))
                      )
                 )
            )
       )
      
   )
   (if (eq ?materia "Moda")
       then
       (if (and (>= ?puntos 1) (< ?puntos 5))
            then
            (bind ?textoFinal (str-cat ?textoFinal "Asesoría de Imagen"))
         else
            (if (and (>= ?puntos 5) (< ?puntos 9))
                 then
                 (bind ?textoFinal (str-cat ?textoFinal "Asesoría de Imagen, Diseño de Moda"))
              else
                 (if (and (>= ?puntos 9) (< ?puntos 13))
                      then
                      (bind ?textoFinal (str-cat ?textoFinal "Asesoría de Imagen, Diseño de Moda, Gestión de la Moda"))
                   else
                      (if (>= ?puntos 13)
                           then
                           (bind ?textoFinal (str-cat ?textoFinal "Asesoría de Imagen, Diseño de Moda, Gestión de la Moda, Diseño Textil"))
                      )
                 )
            )
       )
      
   )
   (if (eq ?materia "Tecnologia")
       then
       (if (and (>= ?puntos 1) (< ?puntos 4))
            then
            (bind ?textoFinal (str-cat ?textoFinal "Soporte Técnico"))
         else
            (if (and (>= ?puntos 4) (< ?puntos 7))
                 then
                 (bind ?textoFinal (str-cat ?textoFinal "Soporte Técnico, Desarrollo Web"))
              else
                 (if (and (>= ?puntos 7) (< ?puntos 11))
                      then
                      (bind ?textoFinal (str-cat ?textoFinal "Soporte Técnico, Desarrollo Web, Ingeniería de Software"))
                   else
                      (if (>= ?puntos 11)
                           then
                           (bind ?textoFinal (str-cat ?textoFinal "Soporte Técnico, Desarrollo Web, Ingeniería de Software, Inteligencia Artificial y Aprendizaje Automático"))
                      )
                 )
            )
       )
      
   )
    (if (eq ?materia "Quimica")
       then
       (if (and (>= ?puntos 1) (< ?puntos 3))
            then
            (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Química"))
         else
            (if (and (>= ?puntos 3) (< ?puntos 6))
                 then
                 (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Química, Ingeniería Química"))
              else
                 (if (and (>= ?puntos 6) (< ?puntos 8))
                      then
                      (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Química, Ingeniería Química, Bioquímica"))
                   else
                      (if (>= ?puntos 8)
                           then
                           (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Química, Ingeniería Química, Bioquímica y Química Ambiental"))
                      )
                 )
            )
       )
      
   )
    (if (eq ?materia "Lenguas")
       then
       (if (and (>= ?puntos 1) (< ?puntos 3))
            then
            (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Lenguas Modernas"))
         else
            (if (and (>= ?puntos 3) (< ?puntos 6))
                 then
                 (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Lenguas Modernas, Lingüística Aplicada"))
              else
                 (if (and (>= ?puntos 6) (< ?puntos 8))
                      then
                      (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Lenguas Modernas, Lingüística Aplicada, Enseñanza de Lenguas Extranjeras"))
                   else
                      (if (>= ?puntos 8)
                           then
                           (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Lenguas Modernas, Lingüística Aplicada, Enseñanza de Lenguas Extranjeras y Filología"))
                      )
                 )
            )
       )
      
   )
    (if (eq ?materia "Historia")
       then
       (if (and (>= ?puntos 1) (< ?puntos 3))
            then
            (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Historia"))
         else
            (if (and (>= ?puntos 3) (< ?puntos 6))
                 then
                 (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Historia, Licenciatura en Arqueología"))
              else
                 (if (and (>= ?puntos 6) (< ?puntos 8))
                      then
                      (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Historia, Licenciatura en Arqueología, Licenciatura en Historia del Arte"))
                   else
                      (if (>= ?puntos 8)
                           then
                           (bind ?textoFinal (str-cat ?textoFinal "Licenciatura en Historia, Licenciatura en Arqueología, Licenciatura en Historia del Arte y Licenciatura en Historia y Ciencias Sociales"))
                      )
                 )
            )
       )
      
   )
   (printout t ?textoFinal crlf)
)

;;;Regla de inicio, donde se preguna el interés de la persona en un tema para saber qué carrera podría sugerir
(defrule pregunta-interes
   =>
   (printout t "*********************************" crlf)
   (printout t "¡Bienvenido al sistema experto de recomendación de sugerir_carreras!" crlf)
    (printout t "NOTA: Esto solo es un programa que recomienda en base a una serie de preguntas acerca de tus preferencias. Te sugerimos también que después de finalizar y recibir las sugerencias sigas consultado sobre las carreras de interés para tomar una mejor decisión" crlf)
   (printout t "Por favor responda algunas preguntas para recibir una recomendación." crlf)
   (printout t "¿Cuál es su area de interes? (Matematicas / Moda / Tecnologia / Química / Lenguas / Historia)" crlf)
   (printout t "*********************************" crlf)
   (printout t  crlf)
   (bind ?interes (read))
   (assert (area-interes ?interes)))


;;;Cuestionario sobre Matemáticas
(defrule recomendacion-Matematicas
   (area-interes Matematicas)
   =>
   (bind ?puntos 0) 
   (printout t "¿Consideras que las matemáticas son utiles en situaciones cotidianas? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 3))) 

   (printout t "¿Has participado en competencias matematicas? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Encuentras interesante la geometria? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Conoces a Euclides, uno de los padres de la geometria? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Crees que las matemáticas son esenciales para el avance científico? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Te sientes cómodo resolviendo problemas matemáticos complejos? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 3))) 

   (printout t "¿Encuentras fascinante el concepto de números primos? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

 
    (printout t "¿Conoces el teorema de Pitágoras en relación con triángulos rectángulos? (si/no) " crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

    
    (bind ?respuesta-num -1)
   (while (not (and (integerp ?respuesta-num) (<= 1 ?respuesta-num 5)))
      (printout t "¿Del 1 al 5 qué tanto te gusta resolver ecuaciones algebraicas? 1 es nada, 5 es mucho" crlf)
      (bind ?respuesta-num (read))
      (if (not (and (integerp ?respuesta-num) (<= 1 ?respuesta-num 5)))
         then
         (printout t "Respuesta no válida. Por favor, ingresa un número entre 1 y 5." crlf)))

   (bind ?puntos (+ ?puntos ?respuesta-num))

   (sugerir_carreras ?puntos "Matematicas")
)

;;;Cuestionario sobre Moda
(defrule recomendacion-Moda
   (area-interes Moda)
   =>
   (bind ?puntos 0) 
   (printout t "¿Te atraen las tendencias de moda actuales? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 3))) 

   (printout t "¿Sigues a diseñadores de moda en redes sociales? (si/no) "crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Has asistido a desfiles de moda en el pasado? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Crees que la moda puede ser una forma de expresión personal? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has asistido a alguna exposición de moda en un museo? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Sigues blogs de moda para inspirarte en tus looks? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Has probado alguna vez el servicio de suscripción de ropa? (si/no) " crlf)
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

;;;Cuestionario sobre Tecnología
(defrule recomendacion-Tecnologia
   (area-interes Tecnologia)
   =>
   (bind ?puntos 0) 
   (printout t "¿Sigues de cerca las últimas novedades tecnológicas?(si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Sientes curiosidad por la programación y te gustaría aprender a crear tus propias aplicaciones o sitios web en el futuro? (si/no) "crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 3))) 

   (printout t "¿Encuentras la inteligencia artificial fascinante?  (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 3))) 

   (printout t "¿Has explorado la realidad virtual alguna vez? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Te emociona la idea de los vehículos autónomos?(si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 
   
   (printout t "¿Tienes experiencia en el uso de asistentes virtuales como Siri o Alexa?(si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

    (printout t "¿Te emociona la idea de aprender sobre las últimas tendencias en dispositivos electrónicos y gadgets?(si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Te sientes intrigado por la criptomoneda y la tecnología blockchain?(si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 2))) 

   (printout t "¿Has utilizado la realidad aumentada en aplicaciones o juegos?(si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    (sugerir_carreras ?puntos "Tecnologia")

)
;;;Cuestionario sobre Química
(defrule recomendacion-Quimica
   (area-interes Quimica)
   =>
   (bind ?puntos 0) 
   (printout t "Te preguntas sobre los ingredientes de los productos que usas? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Has realizado experimentos de química por diversión? (si/no) "crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 


   (printout t " ¿Te gustaría aprender más sobre la relación entre la química y la medicina? (si/no) "crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Encuentras la química orgánica intrigante?  (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Conoces algún compuesto químico común como el agua o el oxígeno? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has realizado experimentos químicos en un laboratorio escolar? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
   
   (printout t "¿Te interesa la química medicinal y el desarrollo de nuevos fármacos? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1)))

     (printout t "¿Sabes cómo se forma una molécula de agua? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

    (printout t "¿Has oído hablar del concepto de pH en relación con sustancias ácidas y básicas? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    
     (sugerir_carreras ?puntos "Quimica")
)

;;;Cuestionario sobre Lenguas
(defrule recomendacion-Lenguas
   (area-interes Lenguas)
   =>
   (bind ?puntos 0) 
   (printout t "¿Te gustaría aprender un nuevo idioma en algún momento?  (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Has viajado a un país donde se hable un idioma diferente al tuyo?  (si/no) "crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Encuentras fascinante la evolución de los idiomas a lo largo del tiempo?  (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Te interesaría estudiar la estructura gramatical de los idiomas? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Has tenido la oportunidad de practicar un idioma extranjero en un país donde se hable? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   
   (printout t "Si has tenido esa experiencia, te ha gustado? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Has utilizado aplicaciones de aprendizaje de idiomas, como Duolingo? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "Si la has usado, te ha gustado? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    
     (sugerir_carreras ?puntos "Lenguas")
)

;;;Cuestionario sobre Historia
(defrule recomendacion-Historia
   (area-interes Historia)
   =>
   (bind ?puntos 0) 
   (printout t "¿Sientes curiosidad por épocas históricas específicas?  (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "  ¿Prefieres la historia política a la cultural en tus lecturas?   (si/no) "crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t " ¿Has leído algún libro histórico en el último año?  (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Crees que entender la historia puede ofrecer lecciones para el presente? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

    (printout t "¿Te interesan más las biografías históricas o los relatos de eventos? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Has visitado algún sitio histórico importante, como un castillo o una ruina antigua? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Disfrutas viendo documentales históricos en tu tiempo libre? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

    (printout t "¿Te interesa la historia de las civilizaciones precolombinas en América? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 

   (printout t "¿Te atrae la historia de civilizaciones antiguas como la egipcia o la romana? (si/no)"crlf)
   (bind ?respuesta (read))
   (if (eq ?respuesta si)
       then
       (bind ?puntos (+ ?puntos 1))) 
    
    (sugerir_carreras ?puntos "Historia")
)

