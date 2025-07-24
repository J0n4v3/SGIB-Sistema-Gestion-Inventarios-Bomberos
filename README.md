Este es un proyecto académico desarrollado como parte del Trabajo Final de Grado (TFG). Consiste en una aplicación web para gestionar el inventario de equipamiento y materiales de una estación de bomberos, incluyendo productos, movimientos de entrada y salida, y usuarios autenticados mediante Devise.

## Contenido

- [Descripción del proyecto](#-sistema-de-gestión-de-inventario-para-estación-de-bomberos-)
- [Tecnologías utilizadas](#-tecnologías-utilizadas)
- [Instalación del proyecto](#️-instalación-del-proyecto)
- [Uso del sistema](#-uso-del-sistema)
- [Despliegue](#-despliegue)
- [Autoría y licencia](#-autoría-y-licencia)


 Tecnologías utilizadas
Lenguaje principal: Ruby 3.x

Framework: Ruby on Rails 7.x

Base de datos: SQLite (desarrollo), PostgreSQL (producción)

Frontend: Bootstrap 5

Autenticación: Devise

Sistema de rutas mejorado: Turbo (Hotwire)

Control de versiones: Git y GitHub

 Instalación del proyecto (Windows 10 con CMD)

### Requisitos previos

Asegurate de tener instalado:

- [Ruby](https://rubyinstaller.org/) (usa RubyInstaller para Windows)
- [Node.js](https://nodejs.org/) (mínimo v14)
- [Yarn](https://classic.yarnpkg.com/en/docs/install/#windows-stable)
- [Git](https://git-scm.com/)
- SQLite3

---

###  Pasos de instalación

1. **Clonar el repositorio desde GitHub**:

   ```cmd
   git clone https://github.com/J0n4v3/Ing_Soft_Gestion_Inventario_Estacion_Bomberos.git
   cd Ing_Soft_Gestion_Inventario_Estacion_Bomberos
Instalar las gemas necesarias:

```cmd
Copiar
Editar
bundle install
```
Instalar paquetes JavaScript y preparar assets:
```
cmd
Copiar
Editar
yarn install
```
Crear y migrar la base de datos:
```
cmd
Copiar
Editar
rails db:create
rails db:migrate
```
Levantar el servidor:
```
cmd
Copiar
Editar
bin\rails server
```
Abrir la app:

Entrá en tu navegador a:
```
http://localhost:3000

```
### Uso del sistema

 Autenticación
El sistema utiliza Devise para el inicio de sesión y registro de usuarios.

Solo los usuarios autenticados pueden gestionar el inventario.

 Modelos principales

1. Producto
nombre:string

descripcion:text

stock:integer

ubicacion:string

Permite registrar materiales como cascos, mangueras, extinguidores, etc.

2. Movimiento
tipo:string (entrada / salida)

cantidad:integer

producto_id:references

motivo:text

fecha:datetime

Permite llevar un historial de entradas y salidas de productos del inventario.

3. Usuario (Devise)
email:string

password:string

### Interfaz
Totalmente responsive gracias a Bootstrap 5.

Navegación sencilla a través de una barra superior fija.

Visualización clara del stock y los movimientos.


### Autoría y licencia
Este proyecto fue desarrollado por Jonathan Verruck  como parte del Trabajo Final de Grado en la carrera de Licenciatura de Sistemas.

Universidad: Universidad Autonoma de Encarnacion

Año: 2025

