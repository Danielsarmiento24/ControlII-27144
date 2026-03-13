# Taller 1 — Análisis de Sistema y Sintonización de Controladores

Este taller corresponde al análisis dinámico de un sistema y al diseño de controladores utilizando métodos clásicos de sintonización. El objetivo es estudiar el comportamiento de una planta en lazo abierto, aproximarla mediante un modelo más simple y posteriormente diseñar controladores que permitan mejorar su desempeño.

## Objetivo del taller

Analizar el comportamiento dinámico de una planta y diseñar controladores utilizando diferentes métodos de sintonización, comparando su desempeño mediante indicadores de control.

## Planta del sistema

La planta analizada está dada por la siguiente función de transferencia:

[
G(s) = \frac{1.5}{(8s + 1)(3s + 1)(s + 1)} e^{-1.5s}
]

Este modelo corresponde a un **sistema de tercer orden con retardo**, el cual presenta múltiples constantes de tiempo y un retardo puro en la dinámica del sistema.

## Actividades desarrolladas

### 1. Análisis de la respuesta al escalón

Se evalúa la respuesta temporal del sistema en **lazo abierto** frente a una entrada escalón con el fin de observar su comportamiento dinámico.

En esta etapa se analizan características como:

* Tiempo de respuesta
* Forma de la salida del sistema
* Influencia del retardo en la dinámica

### 2. Aproximación del sistema

El sistema original se aproxima a un modelo de **primer orden con retardo (FOPDT)** de la forma:

[
G(s) \approx \frac{K}{Ts + 1} e^{-Ls}
]

donde:

* (K) es la ganancia del sistema
* (T) es la constante de tiempo dominante
* (L) es el retardo equivalente

Esta aproximación permite aplicar métodos clásicos de sintonización de controladores.

### 3. Métodos de sintonización

Se estiman los parámetros del controlador utilizando diferentes métodos clásicos:

* **Ziegler–Nichols (ZN)**
* **CHR (Chien–Hrones–Reswick)**

  * Variante 0% de sobreimpulso
  * Variante 20% de sobreimpulso
* **Cohen–Coon**

Cada método genera diferentes parámetros del controlador que afectan el comportamiento del sistema en lazo cerrado.

### 4. Comparación de resultados

Los controladores obtenidos se comparan utilizando diferentes métricas de desempeño:

* Sobreimpulso (Overshoot)
* Tiempo de establecimiento
* Error estacionario
* Índices de desempeño:

  * IAE (Integral Absolute Error)
  * ISE (Integral Squared Error)

Esta comparación permite analizar cuál método ofrece mejores características para la implementación del controlador.

### 5. Selección del controlador

Con base en los resultados obtenidos se seleccionan los parámetros del controlador que proporcionan el mejor compromiso entre:

* rapidez de respuesta
* estabilidad
* reducción del error
* esfuerzo de control

## Herramientas utilizadas

El análisis y simulación del sistema se realizaron utilizando:

* MATLAB
* Control System Toolbox

## Resultados esperados

Al finalizar el taller se obtiene:

* La respuesta dinámica del sistema original
* Una aproximación del sistema mediante modelo FOPDT
* Parámetros de controladores obtenidos por diferentes métodos
* Comparación cuantitativa del desempeño de cada método
* Selección del controlador más adecuado para implementación

## Notas

Repositorio desarrollado con fines académicos para documentar los talleres del curso de **Control**.

