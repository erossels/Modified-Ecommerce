# README

- [x] Crear la o las relaciones y modelos para manejar los productos y sus variaciones. 

*Para permitir las variaciones en talla y color de los productos crearemos el modelo  **variant** con los atributos size, color y stock. Además creamos el modelo **product_variant** que está relacionado al modelo **Product** y **Variant**. Luego de crear los modelos corremos la migración en la base de datos*

```ruby
rails g scaffold variant size color stock:integer
rails g scaffold product_variant product:references variant:references
rails db:migrate
```

*Modificamos los modelos para que incluyan las relaciones. Es neceario modificar el modelo **Product**, **Variant** y **Product_Variant***
```ruby
class Product < ApplicationRecord
  has_many :product_variants
  has_many :variants, through: :product_variants
```

```ruby
class Variant < ApplicationRecord
  has_many :product_variants
  has_many :products, through: :product_variants
```

```ruby
class ProductVariant < ApplicationRecord
  belongs_to :variant
  belongs_to :product
end
```

*Testeamos la relación de los y podemos observar que las relaciones se han creado.*

```
> rails c
Running via Spring preloader in process 1716
Loading development environment (Rails 5.2.3)
2.4.5 :001 > Product.new.product_variants
 => #<ActiveRecord::Associations::CollectionProxy []>
2.4.5 :002 > Product.new.variants
 => #<ActiveRecord::Associations::CollectionProxy []>
2.4.5 :003 > Variant.new.products
 => #<ActiveRecord::Associations::CollectionProxy []>
2.4.5 :004 > Variant.new.products
 => #<ActiveRecord::Associations::CollectionProxy []>
2.4.5 :005 >
```



- [x]Crear la o las relaciones y modelos para manejar las tallas y colores de las variaciones.
4. Implementar la solución para manejar distintos niveles de categorías y asegurarse que no tenga dos padres. También deberás implementar un test unitario para verificar este comportamiento
5. Generar un método o scope en las categorías, de tal forma que entregue una lista de cada categoría padre y otro de sus hijos, y los hijos de sus hijos, en todos los niveles.
6. Según su diseño, explicar al cliente cómo implementar la lista de productos del catálogo. (de un ejemplo en código). Si un modelo necesita código, debes entregarlo al cliente como parte de la implementación.
Tip: ​se sugiere al momento de iniciar el proyecto en github, utilizar README.md para agregar las explicaciones que se solicitan.
7. Implementar o explicar las modificaciones (si las hay) al modelo OrderItem para que siga funcionando sin que afecte el resto del sistema.
Tip:​ el modelo OrderItem tiene atributos ya establecidos, en caso de que la lógica de negocio requiera ingresar algún atributo extra, explicar el ¿por qué? en el archivo README.md
8. Nuestro cliente, a último minuto nos solicita que nuestro sistema soporte cupones de dos tipos:
a) Uno para distribuir en redes sociales (1 cupón lo pueden ocupar muchas personas).
b) Otro para clientes específicos (1 cupón solo lo puede ocupar un cliente específico).
_3
 www.desafiolatam.com
 Los cupones pueden descontar un porcentaje de la compra o un monto específico. En el caso de un monto específico, si el cupón es mayor que la compra, el cupón no puede usarse en otra. Por temas de tiempo, sólo podrás entregarle una prueba de conceptos en la que debes incluir el modelado de los datos extendiendo el resultado de la pregunta 1 y además algunas implementaciones de código con los conceptos más importantes.
Tip: Te recomendamos primero tomar o el a) o el b), y ya teniendo esto listo, empezar con el otro