Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'api#index'

  get 'documentacion' => 'api#documentacion'

  #Metodos disponibles para consultas
  get 'ruta_ubicacion' => 'api#ruta_ubicacion'

end
