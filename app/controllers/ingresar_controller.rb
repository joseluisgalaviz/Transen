class IngresarController < ApplicationController
  skip_before_action :verify_authenticity_token

  def empresas
    render 'empresas'  , :locals => {:err=>nil,:msg=>nil}
  end

  def rutas
    render 'rutas'  , :locals => {:err=>nil,:msg=>nil,:empresas=>Company.all}
  end

  def localizaciones
    render 'localizaciones'  , :locals => {:err=>nil,:msg=>nil}
  end

  def ruta_localizacion
    render 'ruta_localizacion'  , :locals => {:err=>nil,:msg=>nil}
  end

  def punto_interes
    render 'punto_interes'  , :locals => {:err=>nil,:msg=>nil}
  end


  #Metodos de guardado


  def empresas_guardar
    begin
      clave = params[:txtClave]
      nombre = params[:txtNombre]
      if verificar_clave(clave)
          empresa = Company.new
          empresa.name = nombre
          empresa.save
      end
    rescue Exception => e
      render 'empresas'  , :locals => {:err=>'No se pudo guardar'+e.to_s,:msg=>nil}
      return
    end
    render 'empresas'  , :locals => {:err=>nil,:msg=>'Guardado correctamente'}
  end

  def rutas_guardar
    begin
      clave = params[:txtClave]
      nombre = params[:txtNombre]
      empresa = params[:empresa]
      if verificar_clave(clave)
          ruta = Route.new
          ruta.company_id = empresa.to_i
          ruta.name = nombre
          ruta.save
      end
    rescue Exception => e
      render 'rutas'  , :locals => {:err=>'No se pudo guardar',:msg=>nil,:empresas=>Company.all}
      return
    end
    render 'rutas'  , :locals => {:err=>nil,:msg=>'Guardado correctamente',:empresas=>Company.all}
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
              localizacion = Location.new
              localizacion.lat = ubicacion[0]
              localizacion.lon = ubicacion[1]
              localizacion.save
            end
            return render 'localizaciones'  , :locals => {:err=>nil,:msg=>'Guardado correctamente'}
          end
          return render 'localizaciones'  , :locals => {:err=>'Archivo no válido',:msg=>nil}
      else
          render 'localizaciones'  , :locals => {:err=>'Clave no válida',:msg=>nil}
      end
    rescue Exception => e
      render 'localizaciones'  , :locals => {:err=>'No se pudo guardar'+e.to_s,:msg=>nil}
      return
    end
  end

  def ruta_localizacion_guardar
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
            ruta_loc = RouteLocation.new
            ruta_loc.route_id = ubicacion[1].to_i
            ruta_loc.location_id = ubicacion[2].to_i
            ruta_loc.save
          end
          return render 'ruta_localizacion'  , :locals => {:err=>nil,:msg=>'Guardado correctamente'}
        end
        return render 'ruta_localizacion'  , :locals => {:err=>'Archivo no válido',:msg=>nil}
      else
        render 'ruta_localizacion'  , :locals => {:err=>'Clave no válida',:msg=>nil}
      end
    rescue Exception => e
      render 'ruta_localizacion'  , :locals => {:err=>'No se pudo guardar'+e.to_s,:msg=>nil}
      return
    end
  end

  def puntos_interes_guardar
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
            pois = InterestPoint.new
            pois.lat = ubicacion[0]
            pois.lon = ubicacion[1]
            pois.description = ubicacion[2]
            pois.save
          end
          return render 'punto_interes'  , :locals => {:err=>nil,:msg=>'Guardado correctamente'}
        end
        return render 'punto_interes'  , :locals => {:err=>'Archivo no válido',:msg=>nil}
      else
        render 'punto_interes'  , :locals => {:err=>'Clave no válida',:msg=>nil}
      end
    rescue Exception => e
      render 'punto_interes'  , :locals => {:err=>'No se pudo guardar'+e.to_s,:msg=>nil}
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