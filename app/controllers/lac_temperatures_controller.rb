class LacTemperaturesController < ApplicationController
  before_filter :authenticate_user!

  #Pour entrée ici on doit impérativement avoir un lac en parametre, donc on check ici si c'est bien le cas
  before_filter :lac_exist?

  #Verifie l'existant du lac en parametre, si il existe pas, on redirige sur une page d'erreur
  def lac_exist?
    if params[:lac_id]
      @lac = Lac.where(:id => params[:lac_id]).first
    elsif params[:lac_temperature] and params[:lac_temperature][:lac_id]
      @lac = Lac.where(:id => params[:lac_temperature][:lac_id]).first
      params[:lac_temperature].delete(:lac_id)
    end
    redirect_to errors_page_path, :notice => 'Le lac existe pas.' if !@lac
  end

  # GET /lac_temperatures
  # GET /lac_temperatures.json
  def index
    @lac_temperatures = @lac.lac_temperatures.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lac_temperatures }
    end
  end

  # GET /lac_temperatures/1
  # GET /lac_temperatures/1.json
  def show
    @lac_temperature = LacTemperature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lac_temperature }
    end
  end

  # GET /lac_temperatures/new
  # GET /lac_temperatures/new.json
  def new
    @lac_temperature = @lac.lac_temperatures.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lac_temperature }
    end
  end

  # GET /lac_temperatures/1/edit
  def edit
    @lac_temperature = LacTemperature.find(params[:id])
  end

  # POST /lac_temperatures
  # POST /lac_temperatures.json
  def create
    @lac_temperature = @lac.lac_temperatures.new(params[:lac_temperature])

    respond_to do |format|
      if @lac_temperature.save
        format.html { redirect_to lac_temperatures_path(:lac_id => @lac_temperature.lac_id), notice: 'Lac temperature was successfully created.' }
        format.json { render json: @lac_temperature, status: :created, location: @lac_temperature }
      else
        format.html { render action: "new" }
        format.json { render json: @lac_temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lac_temperatures/1
  # PUT /lac_temperatures/1.json
  def update
    @lac_temperature = LacTemperature.find(params[:id])

    respond_to do |format|
      if @lac_temperature.update_attributes(params[:lac_temperature])
        format.html { redirect_to lac_temperatures_path(:lac_id => @lac_temperature.lac_id), notice: 'Lac temperature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lac_temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lac_temperatures/1
  # DELETE /lac_temperatures/1.json
  def destroy
    @lac_temperature = LacTemperature.find(params[:id])
    @lac_temperature.destroy

    respond_to do |format|
      format.html { redirect_to lac_temperatures_path(:lac_id => @lac.id) }
      format.json { head :no_content }
    end
  end
end
