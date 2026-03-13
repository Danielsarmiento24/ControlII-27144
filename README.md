# Taller 2 — Análisis y Diseño de Sistemas de Control

Este taller forma parte del curso de **Control** y tiene como objetivo aplicar conceptos de modelado, análisis dinámico y diseño de controladores utilizando herramientas computacionales.

En este taller se abordan dos problemas relacionados con el análisis de sistemas dinámicos y el diseño de controladores, utilizando **MATLAB** como herramienta principal para simulación y evaluación del desempeño del sistema.

---

# Objetivos del taller

El taller busca desarrollar habilidades en:

* Modelado de sistemas dinámicos mediante funciones de transferencia
* Análisis de la respuesta temporal de sistemas
* Aproximación de modelos dinámicos
* Diseño de controladores PID
* Evaluación de desempeño de sistemas de control
* Implementación y simulación en MATLAB

---

# Estructura del taller

El taller está compuesto por **dos problemas principales**, cada uno enfocado en diferentes aspectos del análisis y diseño de sistemas de control.

---

# Problema 1 — Análisis del sistema

En este problema se realiza el **análisis del comportamiento dinámico de un sistema** a partir de su modelo matemático.

Las actividades principales incluyen:

* Definición de la función de transferencia del sistema
* Análisis de estabilidad
* Evaluación de la respuesta temporal
* Análisis de características dinámicas del sistema
* Interpretación del comportamiento del sistema frente a entradas típicas

Este análisis permite comprender las propiedades dinámicas del sistema antes de realizar cualquier estrategia de control.

---

# Problema 2 — Diseño de controlador PID

En el segundo problema se diseña un **controlador PID** para mejorar el desempeño del sistema y cumplir con ciertas especificaciones dinámicas.

El diseño del controlador considera:

* Respuesta ante cambios en la referencia
* Reducción del sobreimpulso
* Mejora del tiempo de establecimiento
* Eliminación del error estacionario

Para lograrlo se aplican **métodos clásicos de sintonización de controladores**, tales como:

* Ziegler–Nichols
* CHR (Chien–Hrones–Reswick)

Posteriormente se realiza un **ajuste del controlador** para mejorar el desempeño del sistema mediante simulaciones y evaluación de métricas de desempeño.

---

# Metodología general

El procedimiento seguido en el desarrollo del taller incluye:

1. Modelado del sistema mediante función de transferencia
2. Simulación de la respuesta del sistema en lazo abierto
3. Aproximación del modelo cuando es necesario
4. Aplicación de métodos de sintonización de controladores
5. Simulación del sistema en lazo cerrado
6. Comparación de resultados entre diferentes métodos
7. Evaluación del desempeño mediante indicadores de control

---

# Indicadores de desempeño utilizados

Para evaluar el comportamiento del sistema se consideran indicadores comunes en sistemas de control, tales como:

* Sobreimpulso (Overshoot)
* Tiempo de establecimiento
* Error estacionario
* Error integral (IAE, ITSE)
* Energía de control

Estos indicadores permiten comparar el desempeño entre diferentes configuraciones de controladores.


---

# Herramientas utilizadas

El desarrollo del taller se realizó utilizando:

* MATLAB
* Control System Toolbox
* Herramientas de simulación de sistemas dinámicos

---

# Resultados esperados

Al finalizar el taller se obtiene:

* Análisis completo del sistema dinámico
* Comparación entre diferentes estrategias de control
* Diseño de un controlador que mejora el desempeño del sistema
* Evaluación cuantitativa del comportamiento del sistema

---

# Notas

Repositorio desarrollado con fines académicos para documentar el desarrollo de talleres del curso de **Control de Sistemas**.


