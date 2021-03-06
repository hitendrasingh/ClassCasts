class SurveysController < ApplicationController
  #before_filter :authenticate_user!, :except => [:show, :index]
  #load_and_authorize_resource
  
  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
    @notice5 = Post.notice.just5
    @faq5 = Post.faq.just5
    @qna5 = Post.qna.just5
    @casts5 = Cast.just5

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @surveys }
    end
  end

  def grading
    #@survey = Survey.find(params[:id])
    @survey = Survey.new

    redirect_to results_surveys_path  (@survey)
  end

  def results
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
      
    #여기서부터 오류 발생 가능성 있음...//survey를 저장하니 비어있는 question과 answer가 생성됨;;;
    #@question = @survey.questions.build(params[:survey])
    #@question.save
    #@answer =  @question.answers.build(params[:question])
    #@answer.save


    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @survey = Survey.new
    #3.times do
    # question =  @survey.questions.build
    # 4.times { question.answers.build }
    #end
  
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render :json => @survey }
    #end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])
    @survey.user_id = current_user.id

    
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, :notice => 'Survey was successfully created.' }
        format.json { render :json => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.json { render :json => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to @survey, :notice => 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end
end
