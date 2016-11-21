Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'api#index'

  get 'documentacion' => 'api#documentacion'

  #Formularios para el ingreso de datos
  get 'rutas' => 'ingresar#rutas'
  post 'rutas_guardar' => 'ingresar#rutas_guardar'
  get 'empresas' => 'ingresar#empresas'
  post 'empresas_guardar' => 'ingresar#empresas_guardar'

  #Metodos disponibles para consultas
  get 'api/ruta_ubicacion' => 'api#ruta_ubicacion'
  get 'api/ruta_destino' => 'api#ruta_destino'

end
