criterioAntonEgo menu = sum( (map obtenerSal) menu) 
criterioAntonEgo1 menu = (sum .(map obtenerSal)) menu --Utilizando Composicion
criterioAntonEgo2 = sum .(map obtenerSal)  --Utilizando PointFree

obtenerSal (sal,ingredientes,temperatura) = sal
obtenerSal1 (sal,_,_) = sal -- Utilizando variable anonima


obtenerTemperatura (sal,ingredientes,temperatura) = temperatura
obtenerTemperatura1 (_,_,temperatura) = temperatura -- Utilizando variable anonima

obtenerIngredientes (sal,ingredientes,temperatura) = ingredientes
obtenerIngredientes1 (_,ingredientes,_) = ingredientes -- Utilizando variable anonima


criterioColleteTatou menu = all esSaladoYCaliente  menu
esSaladoYCaliente comida = obtenerSal comida > 10 &&  obtenerTemperatura comida >= 40

criterioSkinner cantidadDeMozos menu = all (tieneMayorCantidadDeIngredientesQueMozos cantidadDeMozos )menu

criterioSkinner1 cantidadDeMozos menu = all ((>cantidadDeMozos).obtenerIngredientes) menu


tieneMayorCantidadDeIngredientesQueMozos cantidadDeMozos comida = obtenerIngredientes comida > cantidadDeMozos -- Opcion sin composicion y sin point-free
tieneMayorCantidadDeIngredientesQueMozos1 cantidadDeMozos comida = ((>cantidadDeMozos).obtenerIngredientes) comida -- opcion con composicion y sin point-free
tieneMayorCantidadDeIngredientesQueMozos2 cantidadDeMozos = (>cantidadDeMozos).obtenerIngredientes -- Opcion con composicion y con point-free

type Restaurante = (String, Menu)
type Menu = (Int, Int,Int)

nombreRestaurante (nombre,_) = nombre;
menuRestaurante (_,menu) = menu;
obtenerNombreRestaurantesAprobados criterio restaurantes = map nombreRestaurante  (filter (criterio.menuRestaurante) restaurantes) -- Opcion sin composicion


obtenerNombreRestaurantesAprobados1 criterio restaurantes = (map nombreRestaurante . filter (criterio.menuRestaurante)) restaurantes --opcion con composicion.

obtenerNombreRestaurantesAprobados2 criterio  = map nombreRestaurante . filter (criterio.menuRestaurante) --opcion con composicion y point free

