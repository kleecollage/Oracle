# **API Laravel**

¡Leeme!

---

## **Requisitos previos**

Antes de comenzar, asegúrate de tener instalado lo siguiente en tu sistema:

- [PHP](https://www.php.net/) (versión 8.0 o superior)
- [Composer](https://getcomposer.org/)
- [Git](https://git-scm.com/)
- [Base de datos](https://www.mysql.com/) (MySQL, PostgreSQL, SQLite, etc.)

---

## **Instalación**

Sigue estos pasos para configurar el proyecto en tu máquina local.

### **1. Clonar el repositorio**

Primero, clona el repositorio desde GitHub:

```bash
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
``` 
### **2. Instalar dependencias

Instala las dependencias de Composer:
```bash
composer install
``` 

### **3. Configurar el entorno

Copia el archivo .env.example y renómbralo a .env:
```bash
cp .env.example .env
```

Luego, genera una clave de aplicación única:
```bash
php artisan key:generate
```

### **4. Configurar la base de datos

Abre el archivo .env y configura las credenciales de tu base de datos:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=nombre_de_la_base_de_datos
DB_USERNAME=usuario
DB_PASSWORD=contraseña
```

### **5. Ejecutar migraciones
Ejecuta las migraciones para crear las tablas en la base de datos:
```bash
php artisan migrate
```
(Opcional) Si tienes datos de prueba, puedes ejecutar los seeders:
```bash
php artisan db:seed
```
Ejecutar la API

Para iniciar el servidor de desarrollo, ejecuta:
```bash
php artisan serve
```

Esto iniciará el servidor en http://127.0.0.1:8000. Puedes acceder a la API desde tu navegador o usando herramientas como Postman.

## Contribuir

Si deseas contribuir al proyecto, sigue estos pasos:

1.Haz un fork del repositorio.

2.Crea una rama para tu feature o corrección: git checkout -b mi-feature.

3.Realiza tus cambios y haz commit: git commit -m "Añadir nueva feature".

4.Sube tus cambios: git push origin mi-feature.

5.Abre un Pull Request en GitHub.
