class ApiController < ApplicationController

  def index

  end

  def documentacion
    
  end

  def ruta_ubicacion
    resultados = Hash.new
    begin
      lat = params[:lat]
      lon = params[:lon]
    resultados['Estado']=1
    resultados['Resultados'] = [{:Empresa=>'El Vigia',:Ruta=>'Calle 9 - Sauzal'},{:Empresa=>'Transporte Brisa',:Ruta=>'Calle 9 - Sauzal'}]

    rescue Exception=>e
      resultados['Estado'] = 500;
    end

    res_json = resultados.to_json
    render :json => res_json
  end

  def ruta_destino
    resultados = Hash.new
    begin
      destino = params[:destino]
      resultados['Estado']=1
      resultados['Resultados'] = [{:Empresa=>'El Vigia',:Ruta=>'Calle 9 - Sauzal'},{:Empresa=>'Transporte Brisa',:Ruta=>'Calle 9 - Sauzal'}]

    rescue Exception=>e
      resultados['Estado'] = 500;
    end

    res_json = resultados.to_json
    render :json => res_json
  end



end