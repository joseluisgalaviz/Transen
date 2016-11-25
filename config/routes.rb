Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'api#index'

  get 'documentacion' => 'api#documentacion'

  #Formularios para el ingreso de datos
  get  'rutas' => 'ingresar#rutas'
  post 'rutas_guardar' => 'ingresar#rutas_guardar'
  get  'empresas' => 'ingresar#empresas'
  post 'empresas_guardar' => 'ingresar#empresas_guardar'
  get  'localizaciones' => 'ingresar#localizaciones'
  post 'localizaciones_guardar' => 'ingresar#localizaciones_guardar'
  get  'ruta_localizacion' => 'ingresar#ruta_localizacion'
  post 'ruta_localizacion_guardar' => 'ingresar#ruta_localizacion_guardar'
  get  'punto_interes' => 'ingresar#punto_interes'
  post 'puntos_interes_guardar' => 'ingresar#puntos_interes_guardar'


  #Metodos disponibles para consultas
  get 'api/ruta_ubicacion' => 'api#ruta_ubicacion'
  get 'api/ruta_destino' => 'api#ruta_destino'
  get 'api/ubicaciones_radio' => 'api#ubicaciones_radio'
  get 'api/ubicaciones_radio_destino' => 'api#ubicaciones_radio_destino'

end
