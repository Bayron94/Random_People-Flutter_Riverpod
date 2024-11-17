**Random People App**  

**Random People App** es una aplicación móvil construida en Flutter que consume la API de [Random User](https://randomuser.me/) para mostrar un listado de personas generadas aleatoriamente. La app implementa una arquitectura escalable y moderna utilizando **Feature-First Architecture** junto con **Riverpod** para la gestión de estado y la inyección de dependencias.

---

## 📱 Funcionalidades

1. **Listado de Personas:**
   - Muestra un listado con la información básica de personas generadas por la API, como su nombre y ubicación.
   - Cada tarjeta incluye:
     - Foto de perfil.
     - Nombre completo.
     - Email
     - Teléfono

2. **Detalle de Persona:**
   - Al seleccionar una persona del listado, se navega a la pantalla de detalle.
   - Detalles disponibles:
     - Foto de perfil en tamaño grande.
     - Nombre completo.
     - Email.
     - Genero.
     - Teléfono.
     - Dirección completa.

3. **Pull to Refresh:**
   - En la pantalla de listado, puedes deslizar hacia abajo para recargar la lista y obtener nuevos datos desde la API.

4. **Manejo de Errores:**
   - Notificaciones amigables para el usuario si ocurre algún error en la conexión o durante la carga de datos.
   - Logs detallados para los desarrolladores utilizando `Logger`.

---

## 🛠️ Tecnologías y Herramientas

- **Lenguaje:** Dart
- **Framework:** Flutter
- **Arquitectura:** Feature-First Architecture
- **Gestión de Estado:** Riverpod
- **Inyección de Dependencias:** Riverpod
- **Control de Errores:** dartz
- **HTTP Requests:** dio

---

## 🚀 Instalación y Ejecución

1. **Clona el repositorio:**
   ```
   git clone https://github.com/Bayron94/Random_People-Flutter_Riverpod.git
   cd random_people_app
   ```

2. **Instala las dependencias:**
   ```
   flutter pub get
   ```

3. **Configura el archivo `.env`:**
   - Crea un archivo `.env` en la raíz del proyecto basado en el archivo `.env.template`.
   - Configura la variable `API_BASE_URL` con el endpoint de la API:
     ```
     API_BASE_URL=https://randomuser.me/api
     ```

4. **Ejecuta la aplicación:**
   ```
   flutter run
   ```

---

## 🧭 Cómo Usar la App

1. **Pantalla de Listado:**
   - Al iniciar la app, verás un listado de personas generadas aleatoriamente.
   - Puedes hacer scroll para explorar las personas y si deseas buscar una en especial puedes colocar su nombre en el buscador.
   - Si deseas obtener nuevos datos, realiza un **swipe hacia abajo** para recargar la lista.

2. **Pantalla de Detalle:**
   - Toca cualquier persona en el listado para navegar a su pantalla de detalle.
   - En la pantalla de detalle, podrás ver información adicional como:
     - Dirección completa.
     - Genero

---

## 🧑‍💻 Arquitectura y Estructura del Proyecto

El proyecto sigue la **Feature-First Architecture**, que organiza los archivos por características en lugar de por tipo. Esto facilita la escalabilidad y el mantenimiento del código.

### Estructura de Carpetas

```
lib/
├── core/                # Utilidades, constantes y temas globales
├── features/            # Funcionalidades principales
│   ├── people_random/   # Feature principal
│   │   ├── data/        # Modelos, fuentes de datos y repositorios
│   │   ├── domain/      # Entidades y casos de uso
│   │   ├── presentation/# UI, widgets y providers
├── main.dart            # Punto de entrada de la aplicación
```

### Detalles Clave

- **Gestión de Estado:** 
  - Utilizamos `StateNotifier` de Riverpod para gestionar el estado de la lista y el detalle de personas.
- **Manejo de Errores:** 
  - Uso de `dartz` para capturar errores y `Logger` para registrar fallos en la consola.
- **Temas Personalizados:** 
  - Colores consistentes con un tema global oscuro.

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si deseas agregar nuevas funcionalidades o mejorar el proyecto, no dudes en crear un **issue** o enviar un **pull request**.

---

## 📋 **Contacto**

Desarrollador: Bayron Jhohan Ordoñez Buitron  
Email: [bayron.ordonez94@gmail.com](mailto:bayron.ordonez94@gmail.com)

---