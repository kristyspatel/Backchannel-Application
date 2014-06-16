class ReplyVotesController < ApplicationController
  # GET /reply_votes
  # GET /reply_votes.json
  def index
    @reply_votes = ReplyVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reply_votes }
    end
  end

  # GET /reply_votes/1
  # GET /reply_votes/1.json
  def show
    @reply_vote = ReplyVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reply_vote }
    end
  end

  # GET /reply_votes/new
  # GET /reply_votes/new.json
  def new
    @reply_vote = ReplyVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reply_vote }
    end
  end

  # GET /reply_votes/1/edit
  def edit
    @reply_vote = ReplyVote.find(params[:id])
  end

  # POST /reply_votes
  # POST /reply_votes.json
  def create
    @reply_vote = ReplyVote.new(params[:reply_vote])

    respond_to do |format|
      if @reply_vote.save
        format.html { redirect_to @reply_vote, notice: 'Reply vote was successfully created.' }
        format.json { render json: @reply_vote, status: :created, location: @reply_vote }
      else
        format.html { render action: "new" }
        format.json { render json: @reply_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reply_votes/1
  # PUT /reply_votes/1.json
  def update
    @reply_vote = ReplyVote.find(params[:id])

    respond_to do |format|
      if @reply_vote.update_attributes(params[:reply_vote])
        format.html { redirect_to @reply_vote, notice: 'Reply vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reply_votes/1
  # DELETE /reply_votes/1.json
  def destroy
    @reply_vote = ReplyVote.find(params[:id])
    @reply_vote.destroy

    respond_to do |format|
      format.html { redirect_to reply_votes_url }
      format.json { head :no_content }
    end
  end
end
