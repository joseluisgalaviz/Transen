class ApiController < ApplicationController

  def index

  end

  def documentacion
    
  end

  def ruta_ubicacion
    resultados = Hash.new
    begin
    resultados['Estado']=1
    resultados['Resultados'] = [{:Empresa=>'El Vigia',:Ruta=>'Calle 9 - Sauzal'},{:Empresa=>'Transporte Brisa',:Ruta=>'Calle 9 - Sauzal'}]

    rescue Exception=>e
      resultados['Estado'] = 500;
    end

    res_json = resultados.to_json
    render :json => res_json
  end



end