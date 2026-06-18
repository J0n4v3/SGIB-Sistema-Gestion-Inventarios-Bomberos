# SIGIB — Sistema de Gestión de Inventarios de Bomberos

Prototipo de aplicación web desarrollado como Trabajo Final de Grado (TFG) en la carrera de Licenciatura en Análisis de Sistemas Informáticos de la Universidad Autónoma de Encarnación (UNAE), 2026.

El sistema centraliza la gestión de inventarios de una estación de bomberos voluntarios, permitiendo registrar productos e insumos, controlar el stock mediante movimientos de entrada y salida, gestionar mantenimientos de equipos y administrar usuarios con roles diferenciados.

---

## Módulos del sistema

- **Dashboard** — panel de control con indicadores de stock crítico y mantenimientos pendientes
- **Productos** — catálogo de insumos y equipos con alertas automáticas de stock mínimo
- **Categorías** — clasificación de productos
- **Movimientos de stock** — registro de entradas y salidas con trazabilidad por usuario
- **Ajustes de inventario** — correcciones manuales de stock con auditoría
- **Mantenimientos** — seguimiento de intervenciones técnicas sobre equipos
- **Usuarios** — administración de cuentas con tres roles: Bombero, Encargado y Administrador

---

## Tecnologías

| Componente | Tecnología |
|---|---|
| Lenguaje | Ruby 3.3.5 |
| Framework | Ruby on Rails 7.2 |
| Base de datos | PostgreSQL 17 |
| Frontend | Tailwind CSS + Hotwire |
| Autenticación | Devise |
| Control de versiones | Git / GitHub |
| Entorno de desarrollo | Visual Studio Code + RubyInstaller DevKit (Windows) |

---

## Instalación

### Requisitos previos

- Ruby 3.3.5 (64 bits) — [RubyInstaller DevKit](https://rubyinstaller.org/)
- Rails 7.2
- PostgreSQL 17
- Bundler (`gem install bundler`)
- Git

### Pasos

**1. Clonar el repositorio**
```bash
git clone https://github.com/J0n4v3/SGIB-Sistema-Gestion-Inventarios-Bomberos.git
cd SGIB-Sistema-Gestion-Inventarios-Bomberos
```

**2. Instalar dependencias**
```bash
bundle install
```

**3. Configurar la base de datos**

Verificar que PostgreSQL esté en ejecución. Si las credenciales difieren de las predeterminadas, ajustar `config/database.yml`:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  username: postgres
  password: tu_contraseña
  host: localhost
```

**4. Crear y migrar la base de datos**
```bash
rails db:create
rails db:migrate
rails db:seed
```

**5. Levantar el servidor**
```bash
rails server
```

Acceder desde el navegador en: `http://localhost:3000`

---

## Credenciales de prueba

| Rol | Usuario | Contraseña |
|---|---|---|
| Administrador | admin | password123 |
| Encargado | encargado1 | password123 |
| Bombero | bombero1 | password123 |

---

## Pruebas automatizadas

El proyecto incluye una suite de 30 pruebas funcionales con 47 aserciones. Para ejecutarlas:

```bash
rails test
```

---

## Autor

**Jonathan Gabriel Verruck Eisenkölbl**  
Licenciatura en Análisis de Sistemas Informáticos  
Universidad Autónoma de Encarnación — 2026  
GitHub: [@J0n4v3](https://github.com/J0n4v3)

Año: 2026

