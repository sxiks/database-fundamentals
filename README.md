# Plantilla de Base de Datos

Estructura para el modelado, creación y mantenimiento de bases de datos relacionales.

## Buenas Prácticas
* **Seguridad:** Nunca versionar el archivo `.env` que contiene credenciales reales. Usar `config/.env.example` como referencia.
* **Scripts:** Todo archivo `.sql` dentro de la carpeta `scripts/` debe ser ejecutable sin errores (idempotente).
* **Gitflow:** Crear ramas `feature/` para nuevos modelos o alteraciones de tablas.
