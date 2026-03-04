[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/vbBSU8IV)
# Superpoderoses

En un mundo donde las personas con superpoderes son habituales, se hizo necesaria la implementación 
de un sistema que permite administrar a estos heroes y heroinas para que de una manera eficiente 
puedan enfrentar a los distintos peligros.

## 1. Personajes y sus Poderes

De un personaje se sabe su capacidad de **estrategia** y su **espiritualidad**. Estos son valores
numéricos que se determinan para cada personaje.  Además un personaje tiene asociado varios **poderes**. 
La **capacidad de batalla** del personaje es un número que se calcula como _la sumatoria de los capacidades que
le aportan sus poderes_.


La **capacidad de batalla** de un poder es `(agilidad + fuerza) * habilidadExpecial`. 
La **agilidad**, la **fuerza** y la **habilidad especial** son cosas que se
calculan para el personaje y se detallan a continuación:
   
Para nuestra primera versión vamos a trabajar con 3 sabores de Poderes: _Velocidad_, _Vuelo_ y _Poder Amplificador_ .
- **Velocidad** 

    Un poder de velocidad se define con una **rapidez** (que es un número). 
    
    Los valores que intervienen en el cálculo de la capacidad de batalla se calculan de este modo:
     
	- **agilidad**: es el valor de _estrategia_ del personaje multiplicado por la _rapidez_
	- **fuerza**: es la _espiritualidad_ del personaje multiplicado por la _rapidez_ 
 	- **habilidad especial**: es la suma de la _espiritualidad_ y la _estrategia_ del personaje     

_Nota:_ Un personaje puede tener un poder de velocidad con una rapidez de 2, mientras que otro personaje
puede tener un poder de velocidad con una rapidez de 5. 
- **Vuelo** 

    Un poder de vuelo se define con una **altura maxima** (que es un número) y una **energia para despegue**
    que también es un número. 
    
    
    Los valores que intervienen en el cálculo de la capacidad de batalla se calculan de este modo:
     
	- **agilidad**: es el valor de _estrategia_ del personaje multiplicado por la _altura maxima_ 
					dividido la _energia para despegue_
	- **fuerza**: es la _espiritualidad_ del personaje sumado a la altura máxima menos 
					la _energia para despegue_
 	- **habilidad especial**: Al igual que en _Velocidad_ es la suma de  es la suma de la 
 					_espiritualidad_ y la _estrategia_ del personaje     

_Nota:_ Al igual que con la velocidad, distintos personaje pueden tener distintos poderes de vuelo (algunos pueden volar más alto que otros, por ejemplo). 

- **Poder Amplificador**
	
	Un poder amplificador tiene un **poder base** y un número **amplificador** A partir de los cuales
	se pueden calcular los valores para el cálculo de batalla. 

	- **agilidad**: es la _agilidad_ que le aporta el poder base al personaje
	- **fuerza**: es la _fuerza_ que le aporta el poder base al personaje 
 	- **habilidad especial**: es la _habilidad especial_ que le aporta el poder base al personaje multiplicado por el _amplificador_

_Nota_: Puede haber más de un poder amplificador: un personaje podría tener el poder amplificador 
	con un poder de velocidad como base, y otro personaje podría tener un poder amplificado sobre
	un poder de vuelo.

### Requerimientos

1.1 Saber la capacidad de batalla que un poder otorga a un heroe
 
1.2 Saber la capacidad de batalla de un Personaje 

### Casos de Pruebas

**Poderes**:	
- **alta velocidad** :  Es un poder de  **velocidad** con **2** de _rapidez_
- **super velocidad** : Es un poder de  **velocidad** con **3** de _rapidez_
- **vuelo rasante** :  Es un poder de **vuelo** con **10** de _altura máxima_ y **10** de _energía para despegue_
- **vuelo alto** : Es un poder de **vuelo** con **300** de _altura máxima_ y **200** de  _energía para despegue_
- **vuelo rasante amplificado** : Es un **poder amplificador** con el **vuelo rasante** como _base_ y **4** de _amplificador_
- **super velocidad amplificada** : Es un **poder amplificado** com la  **super velocidad** como _base_ y **3** de _amplificador_)

**Personajes**

- **La Capitana Patria Grande**, heroína del sur que lucha por la unidad latinoamericana. 
Es un **Personaje** con **3** de _estrategia_ y  **5** de _espiritualidad_. 
Sus poderes están conformados por la **super velocidad amplificada** (le aporta 576) y  el 
**vuelo alto** (le aporta 876). Por lo tanto su _capacidad de batalla_ termina siendo de **1452**

- **Plusvalía Cero**, defensor del trabajador, lucha para revertir las injusticias del modelo capitalista.
Es un **Personaje** con **2** de _estrategia_ y **4** de espiritualidad. Sus poderes son la 
**alta velocidad** (le aporta 72) y el **vuelo rasante amplificado** (le aporta 144). 
Por lo tanto su _capacidad de batalla_ termina siendo de **216**, 

- **Usina de Derechos** es la heroina que se pone al frente de la lucha por la adquisición de derechos, 
la igualdad de oportunidades y la eliminación de privilegios. Sus causas más activas son las relacionadas 
con los derechos de la mujer y de las minorías no binarias. Tiene **1** de _estrategia_ y **6** de _espiritualidad_.
Solo cuenta con el _poder_ de **vuelo rasante** (le aporta 49). Su poder de batalla termina siendo de **49**.  

## 2. Equipos 

Un equipo está formado por varios personajes. 

### Requerimientos
 De un equipo interesa saber:
- 2.1 El **miembro más vulnerable**: Es el personaje con la menor capacidad de batalla
- 2.2 La **calidad**  del equipo:  es el promedio de las capacidades de batalla de sus miembros
- 2.3 Los **mejores poderes**: Es el conjunto formado por el mejor poder de cada miembro. El mejor poder
de un personaje es aquel que le otorga la mayor capacidad de batalla.

### Casos de pruebas

La **cooperativa justiciera** es un equipo formado por La **Capitana Patria Grande**, **Plusvalía cero**
y **Usina de derechos**. 

El __miembro más vulnerable__ es **Usina de derechos**.
 
La calidad es  (1452 + 216 + 49) / 3 = **572.33333**. 
 
Los mejores poderes son **vuelo alto** (por la capitana), **vuelo rasante amplificado** (por plusvalía), y **vuelo rasante** (por usina)

_Nota_: Si hay problemas de redondeo se puede usar el metodo `div` de los números para quitar decimales:
```
4 / 3 		-> 1.33333
4.div(3) 	-> 1
```
Los números también entienden el mensaje `truncate` para acotar los decimales:
```
1.33333.truncate(2)		-> 1.33
```
Otra opción es adaptar el valor del test al obtenido en la ejecución.

## 3. Peligros (consultas)

Los personajes enfrentan peligros todos los días, a veces solos, a veces en equipo.

De un peligro se conoce la **capacidad de batalla** y **si tiene desechos radiactivos**,

Un Personaje es capaz de afrontar un peligro de forma individual si se cumplen 
dos condiciones a la vez:
1. La capacidad de batalla del personaje debe ser superior a la del peligro
2. Debe ser capaz de manejar la radiactividad, esto es que _si el peligro tiene desechos radiactivos_ 
el personaje debe ser **inmune a la radiación**. Por supuesto, si el peligro no es radiactivo 
no interesa si el personaje tiene inmunidad o no.

Un personaje es **inmune a la radiactividad** si tiene al menos un poder que le de esa inmunidad:
- Vuelo: Otorga inmunidad si la altura máxima es mayor a 200
- Velocidad: No puede dar inmunidad
- Poder Amplificador: Siempre da inmunidad

### Requerimientos
- 3.1 Saber si un personaje puede enfrentar un peligro.
- 3.2 Saber si un peligro es sensato para un equipo, esto pasa cuando todos los miembros pueden afrontarlo

### Casos de pruebas:
 Para los siguientes peligros:
 - **peligro Sencillo** : **30** _de capacidad de batalla_ y **NO** tiene _desechos radiactivos_,
 - **peligro Sencillo Radiactivo** : **30** de _capacidadDeBatalla_ y **SÍ** tiene _desechos radiactivos_, 
 - **peligro Moderado** : **50** de _capacidadDeBatalla_ y **SÍ** tiene _desechos radiactivos_, 
 - **peligro Alto** : **400** de _capacidadDeBatalla_ y **SÍ** tiene _desechos radiactivos_, 

Probar que:
 - El **peligro Sencillo** puede ser afrontado por la capitana, plusvalía y la usina, por lo tanto **es sensato**.
 - El **peligro Sencillo Radiactivo** y el **peligro moderado** : pueden ser afrontado por la capitana y plusvalía, pero no por la usina, por lo tanto **no son sensatos**.
 - El **peligro Alto** : pueden ser afrontado por la capitana pero no por plusvalía ni  por la usina, por lo tanto **no es sensato**.
  
## 4. Peligros (acciones)

 Hay dos números más relacionados con un peligro:  su **nivel de complejidad** y 
 la **cantidad de personajes que se banca en simultaneo**
 
- Un personaje solo puede afrontar un peligro _si cumple la condición del punto 3.1_.
 Cuando lo hace, su nivel de estrategia aumenta en la cantidad de puntos que 
 marca el nivel de complejidad.
 
- Cuando un equipo a afronta un peligro sólo aquellos miembros que pueden hacerlo 
 de manera individual lo hacen (como se explica en el párrafo anterior). Pero para poder hacerlo 
 es **IMPORTANTE** asegurarse que la cantidad de miembros que van a enfrentarlo 
 superen a la cantidad que el peligro "se banca".
 
### Requerimientos
 
 - 4.1 Hacer que un personaje enfrente un peligro de manera individual
 - 4.2 Hacer que un equipo enfrente un peligro
 
### Casos de prueba

Para los siguientes peligros:
 - **peligro Sencillo** : complejidad = 1, Se banca 2 personajes
 - **peligro Sencillo Radiactivo** : complejidad = 1, Se banca 2 personajes
 - **peligro Moderado** : complejidad = 2, Se banca 1 personaje, 
 - **peligro Alto** : complejidad = 3, Se banca 2 personajes, 
 
 Ocurre lo siguiente:
 
 - Cuando **Usina de derechos**  afronta el **peligro Sencillo** su nivel de estrategia sube a 2
 - **Usina de derechos**  no puede afrontar el **peligro Sencillo Radiactivo** 
 - **Usina de derechos**  no puede afrontar el **peligro Moderado** 
 - Cuando la **Cooperativa Justiciera** afronta el **peligro Moderado**, solo la capitana y plusvalia cero
 participan, haciendo que los niveles de estrategia pasen a ser 5 para la capitana y 4 para plusvalía cero
 - La **Cooperativa justiciera** no puede afrontar el **peligro Alto** ya que no le da la cantidad de miembros
 
 
## 5. Metahumanos y Magos 

Un **Metahumano** es un personaje especial que se diferencia por lo siguiente:
* Su capacidad de batalla es el doble que el de un personaje
* Siempre es inmune a la radiactividad, independientemente de sus poderes
* cuando afronta un peligro, además de incrementar su estrategia también incrementa su espiritualidad
con el valor del nivel de complejidad del peligro

Un **Mago** es un _Metahumano_ especial que se diferencia por lo siguiente
* Tiene un poder acumulado (un numero)
* su capacidad de batalla es la misma de un _Metahumano_ más su poder acumulado
* cuando afronta un peligro, SOLAMENTE aumenta sus niveles de estrategia y espiritualidad como 
hacen los _Metahumanos_ si es que su poder acumulado es mayor a 10. Luego, independientemente de si aumentó 
o no sus niveles, pierde 5 puntos de poder acumulado. Si tenía menos de 5 puntos queda en 0.

## Casos de Prueba
- El **Fragmentador de monopolios**, quien lucha en contra de los abusos empresariales, 
es un **Metahumado** con **1** de _estrategia_, **6** de _espiritualidad_ y solo tiene el
 **vuelo rasante** como _poder_

- El **Educador público**, protector de la educación gratuita, inclusiva, pertinente y de calidad, 
es un **Mago** con **12** de poder acumulado, **1** de _estrategia_, **6** de _espiritualidad_ y solo tiene el **vuelo rasante** como _poder_

Probar que:

- El fragmentador tiene **98** de _capacidad de batalla_, puede afrontar el **peligro sencillo radiactivo**,
y cuando lo hace su nivel de estrategia queda en 2 y el de espiritualidad en 7. No puede afrontar el **peligro alto**

- El educador tiene **110** de _capacidad de batalla_. No puede afrontar el **peligro alto**, pero 
 puede afrontar el **peligro sencillo radiactivo**. Cuando lo hace su nivel de estrategia 
 queda en 2 y el de espiritualidad en 7, y su poder acumulado en 7. Sin embargo si lo vuelve a enfrentar
 sus niveles de estrategia y espiritualidad no se alteran (quedan en 2 y 7) y su poder acumulado
 disminuye a 2





# Acerca de los tests
Este enunciado es acompañado con un archivo de test que tiene diseñado los test a realizar. 
Es importante aclarar que:
- Estos test se proponen para facilitar el desarrollo. Se puede diseñar otros si así se considera necesario.
- El conjunto de tests propuesto es suficiente para este ejercicio. No hace falta agregar nuevos, pero tampoco se prohibe hacerlo.
- Todos los objetos allí usados se asumen como instancias de una clase. Si el diseño de la solución utiliza
objetos bien conocidos en algunos casos entonces se debe remover la declaración de la variable
 y la línea en que se sugiere la instanciación.
- Según el diseño de la solución, es probable que se requiera agregar más objetos a los sugeridos en los tests.
- Los tests están comentados de manera de poder ir incorporándolos a medida que se avanza 
con la solución del ejercicio.








