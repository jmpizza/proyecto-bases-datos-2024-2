# Proyecto de Base de Datos - Panadería y Pastelería

Este proyecto se desarrolla como parte de la materia de Bases de Datos en el segundo semestre de 2024 en la Universidad Nacional de Colombia.

## Descripción del Proyecto

El objetivo de este proyecto es diseñar e implementar un sistema de base de datos para mejorar la gestión operativa de una panadería de barrio ubicada en Bogotá. La panadería ofrece una variedad de productos de panadería y pastelería, incluyendo productos propios y de terceros. Actualmente, muchos de sus procesos se gestionan manualmente, lo que genera ineficiencias en la administración del inventario, las ventas y la contabilidad.

## Funcionalidades del Sistema

- **Gestión de Inventarios:** Registro y control de materias primas y productos externos para minimizar pérdidas y optimizar el reabastecimiento.
- **Registro de Producción:** Seguimiento de los procesos de elaboración de productos para mejorar la planificación y evitar interrupciones.
- **Control de Ventas:** Implementación de un sistema para registrar ventas detalladas y facilitar el análisis de rentabilidad.
- **Administración de Empleados:** Gestión de roles y tareas del personal para mejorar la eficiencia operativa.
- **Gestión Contable:** Registro automatizado de ingresos y egresos para mejorar la toma de decisiones financieras.
- **Registro de Clientes:** Almacenamiento de información de clientes para identificar patrones de consumo y mejorar estrategias de fidelización.

## Tecnologías Utilizadas

- **Base de Datos:** MySQL
- **Backend:** Node.js con Express
- **Frontend:** Next.js (React)

## Instalación y Uso
### Requisitos previos
- [Node.js](https://nodejs.org/) instalado (v18 o superior).
- [Docker Desktop](https://www.docker.com/products/docker-desktop) instalado y en ejecución.

### Pasos para ejecutar el proyecto

1. Clona este repositorio:
   ```sh
   git clone https://github.com/jmpizza/proyecto-bases-datos-2024-2.git
   ```
2. Ingresa al directorio del proyecto:
   ```sh
   cd proyecto-bases-datos-2024-2
   ```
3. Instala las dependencias:
   ```sh
   npm install
   ```
4. Crea un archivo .env.local en la raíz del proyecto y agrega las siguientes variables de entorno:
   ```sh
   DB_HOST=localhost
   DB_PORT=3307
   DB_USER=root
   DB_PASSWORD=root
   DB_NAME=elbuengusto
   ```
5. Inicia el contendor de docker (Docker Desktop debe estar en ejecución)
   ```sh
   npm tun docker:up
   ```
6. Inicia el servidor:
   ```sh
   npm run dev
   ```

## Licencia

Este proyecto se encuentra bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

