class IngresarController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def empresas
    render 'empresas'  , :locals => {:err=>nil}
  end

  def rutas
    render 'rutas'  , :locals => {:err=>nil}
  end

  def localizaciones
    render 'localizaciones'  , :locals => {:err=>nil}
  end

  def rutas_guardar
    @key = 'C0N9RYKA4IKWX08'
    begin
      clave = params[:txtClave]
      nombre = params[:txtNombre]
      if clave!=nil
        if clave == @key
          ruta = Ruta.new
          ruta.nombre = nombre
          ruta.save
        end
      end

    rescue Exception => e
      render 'rutas'  , :locals => {:err=>'No se pudo guardar'}
      return
    end
    render 'rutas'  , :locals => {:err=>nil}
  end

  def empresas_guardar
    @key = 'C0N9RYKA4IKWX08'
    begin
      clave = params[:txtClave]
      nombre = params[:txtNombre]
      if clave!=nil
        if clave == @key
          empresa = Empresa.new
          empresa.Nombre = nombre
          empresa.save
        end
      end

    rescue Exception => e
      render 'empresas'  , :locals => {:err=>'No se pudo guardar'+e.to_s}
      return
    end
    render 'empresas'  , :locals => {:err=>nil}
  end


  def localizaciones_guardar
    @key = 'C0N9RYKA4IKWX08'
    begin
      clave = params[:txtClave]
      descripcion = params[:txtNombre]
      latitud = params[:txtLat]
      longitud = params[:txtLon]
      if clave!=nil
        if clave == @key
          localizacion = Localizacione.new
          localizacion.Descripcion = descripcion
          localizacion.Lat = latitud
          localizacion.Lon = longitud
          localizacion.save
        end
      end

    rescue Exception => e
      render 'localizaciones'  , :locals => {:err=>'No se pudo guardar'+e.to_s}
      return
    end
    render 'localizaciones'  , :locals => {:err=>nil}
  end

end