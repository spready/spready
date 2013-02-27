require_dependency "spready/application_controller"

module Spready
  class TopicsController < ApplicationController
    # GET /topics
    # GET /topics.json
    def index
      @topics = Topic.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @topics }
      end
    end
  
    # GET /topics/1
    # GET /topics/1.json
    def show
      @topic = Topic.find(params[:id])
      @comment = Comment.new
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @topic }
      end
    end
  
    # GET /topics/new
    # GET /topics/new.json
    def new
      @forum    = Forum.find_by(:permalink => params[:forum_id])
      @category = @forum.categories.find_by :permalink => params[:category_id]
      @topic = Topic.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @topic }
      end
    end
  
    # GET /topics/1/edit
    def edit
      @topic = Topic.find(params[:id])
    end
  
    # POST /topics
    # POST /topics.json
    def create
      @forum = Forum.find_by(:permalink => params[:forum_id])
      @category = @forum.categories.find_by(:permalink => params[:topic][:category_id])
      @topic = @category.topics.build(params[:topic])
  
      respond_to do |format|
        if @topic.save
          format.html { redirect_to forum_topic_url(@forum, @topic), :notice => 'Topic was successfully created.' }
          format.json { render :json => @topic, :status => :created, :location => @topic }
        else
          format.html { render :action => "new" }
          format.json { render :json => @topic.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /topics/1
    # PUT /topics/1.json
    def update
      @topic = Topic.find(params[:id])
  
      respond_to do |format|
        if @topic.update_attributes(params[:topic])
          format.html { redirect_to @topic, :notice => 'Topic was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @topic.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /topics/1
    # DELETE /topics/1.json
    def destroy
      @topic = Topic.find(params[:id])
      @topic.destroy
  
      respond_to do |format|
        format.html { redirect_to topics_url }
        format.json { head :no_content }
      end
    end
  end
end
