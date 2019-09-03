class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    @relation = Relationship.new(user_one_id: current_user.id, user_two_id: params[:user_id])
    respond_to do |format|
      if @relation.save
        new_friend = User.find(params[:user_id])
        format.json { 
          render json: new_friend, status: :created, location: @relation
        }
      else
        format.json {
          render json: @relation.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @relation = Relationship.where(user_one_id: current_user.id, user_two_id: params[:id]).first

    respond_to do |format|
      if @relation.destroy
        friend = User.find(params[:id])
        format.json { 
          render json: friend, status: :created, location: @relation
        }
      else
        format.json {
          render json: @relation.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def show
    # TODO: Check and refactor the next:
    # the next line should return a list of posts created by current user
    # current_user.articles
    @articles = Article.where(user_id: current_user.id)
    @possible_friends = User.all - [current_user] - current_user.friends
  end

end
  