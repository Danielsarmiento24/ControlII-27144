# Control II
# Diseño de Compensadores Clásicos en Sistemas de Control

Este repositorio contiene el desarrollo y la validación de un **Taller Integrador** enfocado en el diseño de compensadores para sistemas lineales de control. El proyecto aborda la mejora del desempeño dinámico y en régimen permanente mediante métodos clásicos tanto en el dominio del tiempo como en el de la frecuencia.

## Contenido del Proyecto

El trabajo se divide en ejercicios prácticos que aplican diferentes estrategias de compensación sobre diversas plantas dinámicas:

* **Compensadores en Adelanto:** Diseñados mediante el **Lugar Geométrico de las Raíces (LGR)** y **Diagramas de Bode** para mejorar la rapidez y estabilidad relativa (margen de fase).
* **Compensadores en Atraso:** Implementados para reducir el error en estado estacionario ante entradas tipo rampa, manteniendo las características transitorias.
* **Sistemas Tipo 2:** Diseño de compensadores tipo adelanto (PD) para estabilizar plantas con doble integrador y cumplir especificaciones de sobrepaso y tiempo de establecimiento.
* **Comparativa LGR vs. Bode:** Análisis detallado de las ventajas de diseñar en el dominio del tiempo (control sobre polos) frente al dominio de la frecuencia (robustez y estabilidad relativa).

## Herramientas Utilizadas

* **Análisis Teórico:** Cálculos analíticos de polos, ceros y ganancias basados en criterios de estabilidad y desempeño ($M_p$, $T_s$, $PM$, $e_{ss}$).
* **MATLAB:** Uso de scripts y herramientas de simulación para la validación numérica y gráfica (LGR, Bode y respuesta temporal).

##  Resultados Destacados

El proyecto demuestra cómo la correcta selección de un compensador permite:
1. **Transformar sistemas lentos** en respuestas rápidas con amortiguamiento adecuado.
2. **Optimizar la precisión** en estado estacionario sin comprometer la estabilidad.
3. **Validar la robustez** del diseño comparando aproximaciones manuales con resultados exactos computacionales.

## 👥 Autores
* Daniel Felipe Sarmiento Pilonieta
* Monica Cristina Peña Rincon
* Fabian Andres Amador Ballesteros

