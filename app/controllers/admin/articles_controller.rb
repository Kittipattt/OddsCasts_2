class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    # Check for bad words in title and description after form submission
    if ProfanityFilter.contains_profanity?(@article.title) || ProfanityFilter.contains_profanity?(@article.description)
      flash[:alert] = "Your article contains inappropriate language."
      render :new and return  # Prevent the article from being saved and re-render the form
    end

    # Proceed with saving the article if no bad words are detected
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_path(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def bad_words
    # Fetch the bad words from the ProfanityFilter
    bad_words = ProfanityFilter.send(:load_bad_words)
    if bad_words.any?
      render json: { bad_words: bad_words }
    else
      render json: { error: "Bad words file not found" }, status: 404
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    Rails.logger.debug "Article ID: #{@article.id}"
    Rails.logger.debug "Params: #{article_params.inspect}"

    respond_to do |format|
      if ProfanityFilter.contains_profanity?(@article.title) || ProfanityFilter.contains_profanity?(@article.description)
        flash[:alert] = "Your article contains inappropriate language. Please remove it."
        Rails.logger.debug "Profanity detected in update"
        render :edit and return
      end

      if @article.update(article_params)
        Rails.logger.debug "Article updated successfully"
        format.html { redirect_to admin_article_path(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        Rails.logger.debug "Article update failed: #{@article.errors.full_messages}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!
    respond_to do |format|
      format.html { redirect_to admin_articles_path, status: :see_other, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :cover)
  end
end
