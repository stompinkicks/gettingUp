class PatternsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  # GET /patterns
  # GET /patterns.json
  def index
    @patterns = Pattern.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patterns }
    end
  end

  # GET /patterns/1
  # GET /patterns/1.json
  def show
    @pattern = Pattern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pattern }
    end
  end

  # GET /patterns/new
  # GET /patterns/new.json
  def new
    @pattern = current_user.patterns.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pattern }
    end
  end

  # GET /patterns/1/edit
  def edit
    @pattern = current_user.patterns.find(params[:id])
  end

  # POST /patterns
  # POST /patterns.json
  def create
    @pattern = current_user.patterns.new(params[:pattern])

    respond_to do |format|
      if @pattern.save
        format.html { redirect_to @pattern, notice: 'Pattern was successfully created.' }
        format.json { render json: @pattern, status: :created, location: @pattern }
      else
        format.html { render action: "new" }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patterns/1
  # PUT /patterns/1.json
  def update
    @pattern = current_user.patterns.find(params[:id])

    respond_to do |format|
      if @pattern.update_attributes(params[:pattern])
        format.html { redirect_to @pattern, notice: 'Pattern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patterns/1
  # DELETE /patterns/1.json
  def destroy
    @pattern = current_user.patterns.find(params[:id])
    @pattern.destroy

    respond_to do |format|
      format.html { redirect_to patterns_url }
      format.json { head :no_content }
    end
  end
end
