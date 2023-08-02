# DESCRIPCIÓN DEL CONJUNTO DE DATOS
## Descripción general
Los datos se han dividido en dos grupos:

* Conjunto de vehículos (vehiculo.csv)
* Conjunto de accidentes (accidente.csv)

```
vehiculo.csv
```

| Variable | Definición| 
| :-------- | :------- | 
| `VehiculosID`| `Identificador único para cada vehículo` |
| `AccidenteIndex`| `Identificador único para cada accidente` |
| `TipoVehiculo`| `Tipo de vehículo ` |
| `PuntoImpacto`| `Punto específico del impacto en el vehículo` |
| `ManoIzquierda`| `Indica si el vehículo tiene la dirección del volante a la izquierda` |
| `PropositoViaje`| `Motivo del viaje del vehículo en el momento del accidente` |
| `Propulsion`| `Tipo de propulsión del vehículo` |
| `EdadVehiculo`| `Edad del vehículo` |

#### dataset accidentes:

```
accidente.csv
```

| Variable | Definición| 
| :-------- | :------- | 
| `AccidenteIndex` | `Identificador único del accidente` | 
| `Gravedad` |  `Gravedad del accidente` |
| `Fecha`|`Fecha del accidente` |
| `Dia`|`Día de la semana en que ocurrió el accidente` |
| `LimiteVelocidad`|`Límite de velocidad permitido en la ubicación del accidente` |
| `Condiciones_de_luz`|`Condiciones de iluminación en el momento del accidente` |
| `Condiciones_climaticas`|`Condiciones climáticas en el momento del accidente` |
| `Condiciones_del_camino`|`Estado de la carretera en el momento del accidente` |
| `Area`|`Tipo de área donde ocurrió el accidente` |