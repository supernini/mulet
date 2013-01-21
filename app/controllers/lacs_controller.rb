class LacsController < ApplicationController
  before_filter :authenticate_user!

  # GET /lacs
  # GET /lacs.json
  def index
    @lacs = Lac.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lacs }
    end
  end

  # GET /lacs/1
  # GET /lacs/1.json
  def show
    @lac = Lac.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lac }
    end
  end

  # GET /lacs/new
  # GET /lacs/new.json
  def new
    @lac = Lac.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lac }
    end
  end

  # GET /lacs/1/edit
  def edit
    @lac = Lac.find(params[:id])
  end

  # POST /lacs
  # POST /lacs.json
  def create
    @lac = Lac.new(params[:lac])

    respond_to do |format|
      if @lac.save
        format.html { redirect_to @lac, notice: 'Lac was successfully created.' }
        format.json { render json: @lac, status: :created, location: @lac }
      else
        format.html { render action: "new" }
        format.json { render json: @lac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lacs/1
  # PUT /lacs/1.json
  def update
    @lac = Lac.find(params[:id])

    respond_to do |format|
      if @lac.update_attributes(params[:lac])
        format.html { redirect_to @lac, notice: 'Lac was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lacs/1
  # DELETE /lacs/1.json
  def destroy
    @lac = Lac.find(params[:id])
    @lac.destroy

    respond_to do |format|
      format.html { redirect_to lacs_url }
      format.json { head :no_content }
    end
  end
end
