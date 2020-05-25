# PresupiestoFranciscoAMP
Creación de proyecto PresupuestoFranciscoAMP en el que se crea un presupuesto de seguros del hogar, teniendo en cuenta los siguientes aspectos: 

1. Los seguros pueden ser de dos tipos y se puede hacer sobre cualquiera de ellos o de los dos a la vez.
2. Existe seguro de continente (la casa en si) o de contenido (lo que contiene la casa).

Nombre de la agencia de **Seguros Gestoria de Seguros NORMAS**.

Se estrutura de la siguiente manera:

Dentro de Web Pages añadimos archivo index.html, donde va un menú que en que dá a elegir como queremos ejecutar
la aplicación.

Creamos los directorios:
	- CSS -> En este archivo es donde van los estilos de todas las páginas del proyecto, incluido los errores.
	- FONT ->  Se añade la fuente que se vá a utilizar. SanFrancisco.ttf
	- IMG -> Donde van las imagenes utilizadas en el proyecto y la de los errores.
	- INC -> Se crean los archivos de cabecera y pie de página cabecera.inc y piePagina.inc, así como el archivo metas.inc
           donde van la información SEO de la página.
	- JSP -> Se diferencia entre la ejecución de la aplicación de manera normal y utilizando en las páginas JSP Lenguaje de 
           Expresion, por lo que se crean las carpetas JSP y JSPLE su contenido es el siguiente:
			- JSP, se crean los archivos contenido.jsp, edificio.jsp, ver Cuota.jsp e index.jsp 
			- JSPLE, se crean los archivos contenido.jsp, edificio.jsp, 
			  verCuota.jsp e index.jsp pero utilizando Lenguaje de expresión.
			- errores, ubicación de las páginas de error 500 y 404.

En Source Packages,los paquetes:

	- es.albarregas.beans, dentro se crean las clases Contenidos.java, Edificios.java y Elecciones.java.
	- es.albarregas.controllers, donde se crearán los controladores de la aplicación, es decir, los Servlets
    contenido.java, edificio.java y eleccion.java
	- es.albarregas.models, donde se calcula la cuota. En la clase CalcularCuota.java

En WEB-INF:
Se crea el archivo web.xml para la configuración de los errores 500 y 404.

25/05/20
by Francisco Antonio Murillo Pacheco

-------------------------------------------------------------------------------------------------------------------------
