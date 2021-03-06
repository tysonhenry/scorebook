class HighScoresController < ApplicationController

  # GET /high_scores
  def index
    @high_scores = HighScore.all
  end

  # GET /high_scores/1
  def show
    @high_score = HighScore.find(params[:id])
  end


  # GET /high_scores/new
  def new
    @high_score = HighScore.new
  end

  # POST /high_scores
  def create
    # the require function pulls the sub-hash :high_score 
    #   out of the entire params hash
    # the permit functions limits the considered 
    #   parameters so a malicious user from 
    # cannot inject additional <field,value> entries into the params hash
    @high_score = HighScore.new(params.require(:high_score).permit(:user, :game, :score))

    if @high_score.save
      redirect_to @high_score, notice: 'High score was successfully created.  Fucking yeah!'
    else
      render :new
    end
  end

  # GET /high_scores/1/edit
  def edit
    @high_score = HighScore.find(params[:id])
  end

  # PATCH/PUT /high_scores/1
  def update
    @high_score = HighScore.find(params[:id])
    if @high_score.update(params.require(:high_score).permit(:user, :game, :score))
      redirect_to @high_score, notice: 'High score was successfully updated.' 
    else
      render :edit
    end
  end

  # DELETE /high_scores/1
  def destroy
    @high_score = HighScore.find(params[:id])
    @high_score.destroy
      redirect_to high_scores_url, notice: 'High score was successfully destroyed.' 
  end


end
