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
      coord = Coordinate.new('',lat,lon)
      dist = Distance.new
      rutas_encontradas=[]
      radio = 400 #Se define un radio de 400mts
      #Obtener las rutas
      routes = Route.all

      if routes.length>0
      routes.each do |r|
        #Recorrer las ubicaciones por las que pasa la ruta
        locations = Location.joins("INNER JOIN route_locations ON locations.id=route_locations.location_id AND route_locations.route_id="+r.id.to_s)
        locations.each do |l|
          coord_route = Coordinate.new('',l.lat,l.lon)
          if dist.inside?(coord,coord_route,radio)
             nombre_empresa = Company.find(r.company_id)
             rutas_encontradas<< {:Empresa => nombre_empresa.name,:Ruta=>r.name}
             break
          end
        end
      end
      end
      resultados['Estado']=1
      resultados['Resultados'] = rutas_encontradas

    rescue Exception=>e
      resultados['Estado'] = e.to_s;
    end

    res_json = resultados.to_json
    render :json => res_json
  end

  def ruta_destino
    resultados = Hash.new
    begin
      destino = params[:destino]

      dist = Distance.new
      rutas_encontradas=[]
      radio = 400 #Se define un radio de 400mts

      #Obtenemos datos del punto de interes
      puntos_encontrados = []
      pois =InterestPoint.where("description ILIKE ?","%#{destino}%")
      coord = nil
      #Falta considerar lo que pasa cuando muchos sitios tiene un nombre semejante
      if pois.length>0
        pois.each do |p|
          coord = Coordinate.new('',p.lat,p.lon)
          break
          #puntos_encontrados<<coord
        end
      end


      #Obtener las rutas
      routes = Route.all

      routes.each do |r|
        #Recorrer las ubicaciones por las que pasa la ruta
        locations = Location.joins("INNER JOIN route_locations ON locations.id=route_locations.location_id AND route_locations.route_id="+r.id.to_s)
        locations.each do |l|
          coord_route = Coordinate.new('',l.lat,l.lon)
          if dist.inside?(coord,coord_route,radio)
            nombre_empresa = Company.find(r.company_id)
            rutas_encontradas<< {:Empresa => nombre_empresa.name,:Ruta=>r.name}
            break
          end
        end

      end

      resultados['Estado']=1
      #resultados['Resultados'] = [{:Empresa=>'El Vigia',:Ruta=>'Calle 9 - Sauzal'},{:Empresa=>'Transporte Brisa',:Ruta=>'Calle 9 - Sauzal'}]
      resultados['Resultados'] = rutas_encontradas
    rescue Exception=>e
      resultados['Estado'] = e.to_s;
    end

    res_json = resultados.to_json
    render :json => res_json
  end

  def ubicaciones_radio
    resultados = Hash.new
    begin
      lat = params[:lat]
      lon = params[:lon]
      coord = Coordinate.new('',lat,lon)
      dist = Distance.new
      rutas_encontradas=[]
      radio = params[:rad].to_i
      #Obtener las rutas
      routes = Route.all

      if routes.length>0
      routes.each do |r|
        #Recorrer las ubicaciones por las que pasa la ruta
        locations = Location.joins("INNER JOIN route_locations ON locations.id=route_locations.location_id AND route_locations.route_id="+r.id.to_s)
        locations.each do |l|
          coord_route = Coordinate.new('',l.lat,l.lon)
          if dist.inside?(coord,coord_route,radio)
            nombre_empresa = Company.find(r.company_id)
            rutas_encontradas<< {:Empresa => nombre_empresa.name,:Ruta=>r.name}
            break
          end
        end
      end
      end
      resultados['Estado']=1
      resultados['Resultados'] = rutas_encontradas

    rescue Exception=>e
      resultados['Estado'] = e.to_s;
    end

    res_json = resultados.to_json
    render :json => res_json
  end

end