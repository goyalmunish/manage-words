class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  helper_method :current_filters_and_orders, :add_to_current_filters_and_orders

  # GET /words
  # GET /words.json
  def index
    @page_title = ['Words']

    # conditionally clear_all_filters_and_orders
    if params[:reset]
      clear_all_filters_and_orders
      redirect_to words_path and return
    end
    if params[:format] == 'download'
      clear_all_filters_and_orders
    end

    # words collection with eager loaded flags
    @words = current_user.words.includes(:flags)
    # user dictionaries
    @dictionaries = current_user.dictionaries

    # checking filters
    if params[:flag_id]
      if params[:flag_id].to_i > 0
        @flag = Flag.find(params[:flag_id])
        @words = @words.with_flag_id(@flag.id)
      elsif params[:flag_id].to_i == 0
        @words = @words.without_flag
      end
    end
    if params[:filter_by]
      if params[:filter_by] == 'without_trick'
        @words = @words.without_trick
      elsif params[:filter_by] == 'with_trick'
        @words = @words.with_trick
      end
    end

    # checking orders
    if params[:sort_by]
      if params[:sort_by] == 'random'
        @words = @words.sort_by { rand }
      elsif params[:sort_by] == 'recent'
        @words = @words.reorder(:updated_at => :desc)
      end
    end

    # generating custom ETag
    # fresh_when([@words, @filters, @order])

    # responding
    if stale?(etag: [current_user.id, current_filters_and_orders, @words])
      respond_to do |format|
        format.html # index.html.erb
        format.json # index.json.jbuilder
        format.xml { render :xml => @words.to_xml(:include => {:flags => {:only => [:name, :value]}}, :only => [:word, :trick, :additional_info]) }
        format.download { send_data Word.data_backup(@words).to_json, {:filename => "words #{Time.now.getutc}.json".split(' ').join('-')} }
      end
    end

  end

  # this action is no longer used as now cache is being expired on 'touch' on association 
  def expire_my_word_caches
    Word.touch_latest_updated_at_word_record_for_user(current_user)
    redirect_to words_path and return
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @page_title = [@word.word]
    @dictionaries = current_user.dictionaries
  end

  # GET /words/new
  def new
    @word = current_user.words.build
  end

  # GET /words/1/edit
  def edit
    @page_title = [@word.word, 'Edit']
  end

  # POST /words
  # POST /words.json
  def create
    @word = current_user.words.build(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def backup_restore_form
  end

  def backup_restore
    # getting json content
    file = params[:file]
    json_content = JSON.parse(file.read)
    # passing it to model to process
    count = Word.restore_backup(current_user.id, json_content)
    # responding to user
    flash[:notice] = "Number of records added: #{count}"
    redirect_to words_path and return
  end

  # note that this method should not attempt to add values to params directly
  def add_to_current_filters_and_orders(passed_hash = nil)
    filters_and_orders = current_filters_and_orders
    # adding passed hash to params
    unless passed_hash.blank?
      passed_hash.each do |key, value|
        filters_and_orders[key] = value
      end
    end
    # returning current value of filters and orders
    return filters_and_orders
  end

  def current_filters_and_orders
    filters_and_orders = Hash.new
    # existing filters or orders
    [:flag_id, :sort_by, :filter_by].each do |elem|
      if params[elem]
        filters_and_orders[elem] = params[elem]
      end
    end
    return filters_and_orders
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_word
    @word = current_user.words.includes(:flags).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def word_params
    # patch for check_box_tag
    # an attribute from check_box_tag becomes part of params only if it is checked
    # so, the if you try to uncheck the only unchecked flag left for a word, nothing happen to flags association
    # it is because flag_ids in this case is nil, so we need to set it to blank array
    # also note that this patch is not required for collection_check_box
    # unless params[:word][:flag_ids]
    #   params[:word][:flag_ids] = []
    # end
    # resuming to actual logic
    params.require(:word).permit(:word, :trick, :additional_info, :flag_ids => [])
  end

  # called by index action
  def clear_all_filters_and_orders
    [:flag_id, :sort_by, :filter_by, :reset].each do |elem|
      params[elem] = nil
      # session[elem] = nil # though, this is not required
    end
  end

end
