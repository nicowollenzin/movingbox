class BoxesController < ApplicationController
  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boxes }
    end
  end

  # GET /boxes/1
  # GET /boxes/1.json
  def show
    @box = Box.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @box }
    end
  end

  # GET /boxes/1/print
  # GET /boxes/1/print.json
  def print
    @box = Box.find(params[:id])

    respond_to do |format|
      format.pdf { render :layout => false }
    end
  end

  # GET /boxes/new
  # GET /boxes/new.json
  def new
    @box = Box.new
    3.times { @box.things.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @box }
    end
  end

  # GET /boxes/1/edit
  def edit
    @box = Box.find(params[:id])
  end

  # POST /boxes
  # POST /boxes.json
  def create
    @box = Box.new(params[:box])

    respond_to do |format|
      if @box.save
        dest_url = url_for(:controller => 'boxes', :action => 'show', :id => @box.id ,:only_path => false)
        qr_code_img = RQRCode::QRCode.new(dest_url, :size => 4, :level => :h ).to_img.resize(300, 300)

        @box.update_attribute :qr_code, qr_code_img.to_string
        format.html { redirect_to @box, notice: 'Box was successfully created.' }
        format.json { render json: @box, status: :created, location: @box }
      else
        format.html { render action: "new" }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /boxes/1
  # PUT /boxes/1.json
  def update
    @box = Box.find(params[:id])

    if @box.qr_code.nil?
      dest_url = url_for(:controller => 'boxes', :action => 'show', :id => @box.id ,:only_path => false)
      qr_code_img = RQRCode::QRCode.new(dest_url, :size => 4, :level => :h ).to_img.resize(300, 300)
      @box.update_attribute :qr_code, qr_code_img.to_string
    end
    respond_to do |format|
      if @box.update_attributes(params[:box])
        format.html { redirect_to @box, notice: 'Box was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  def destroy
    @box = Box.find(params[:id])
    @box.destroy

    respond_to do |format|
      format.html { redirect_to boxes_url }
      format.json { head :no_content }
    end
  end
end
