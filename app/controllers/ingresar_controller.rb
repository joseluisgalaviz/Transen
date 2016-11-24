class IngresarController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    begin
      clave = params[:txtClave]
      if verificar_clave(clave)
          file_data = params[:submitDatos]
          datos_localizacion = nil
          if file_data!=nil
            if file_data.respond_to?(:read)
              datos_localizacion = file_data.read
            elsif file_data.respond_to?(:path)
              datos_localizacion = File.read(file_data.path)
            else
              logger.error "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
            end
            #Parse data from JSON
            datos_localizacion.gsub!(/\r\n?/, "\n")
            datos_localizacion.each_line do |linea|
              ubicacion = linea.split(',')
              punto_int = PuntosInteres.new
              punto_int.Descripcion = ubicacion[2]
              punto_int.Lat = ubicacion[0]
              punto_int.Lon = ubicacion[1]
              punto_int.save
            end
            return render 'localizaciones'  , :locals => {:err=>datos_localizacion.to_json}
          end
          return render 'localizaciones'  , :locals => {:err=>datos_localizacion.to_json}
      else
          render 'localizaciones'  , :locals => {:err=>nil}
      end
    rescue Exception => e
      render 'localizaciones'  , :locals => {:err=>'No se pudo guardar'+e.to_s}
      return
    end
  end

    def verificar_clave(clave)
      @key = 'C0N9RYKA4IKWX08'
      if clave!=nil
        if clave==@key
          return true
        else
          return false
        end
      end
      false
    end

end