class InboxController < ApplicationController
  def inbox
  	@posts = Post
  	.where(certificate: [nil, false])
  	.where(level_id: [nil, false])
  	.where(skill_id: [nil, false])
  	.where.not(body: "Welcome to Rackley Swimming")
  	.where(note: [nil, false])
  	.where.not(user_id: current_user.id)
  	.all.order("updated_at DESC")

  	@comments = Comment.where.not(user_id: current_user.id)
  	.all.order("updated_at DESC")

  	@comment = Comment.new

  end

  def inbox_new
  	@posts = Post
  	.where(certificate: [nil, false])
  	.where(level_id: [nil, false])
  	.where(skill_id: [nil, false])
  	.where.not(body: "Welcome to Rackley Swimming")
  	.where(actioned: [false, nil])
  	.where(note: [nil, false])
  	.where.not(user_id: current_user.id)
  	.all.order("created_at DESC")

  	@comments = Comment.where(acknowleged: [false, nil])
  	.where.not(user_id: current_user.id)
  	.all.order("created_at DESC")

  	@comment = Comment.new

  end
  def inbox_actioned
  	@posts = Post
  	.where(certificate: [nil, false])
  	.where(level_id: [nil, false])
  	.where(skill_id: [nil, false])
  	.where.not(body: "Welcome to Rackley Swimming")
  	.where(actioned: true)
  	.where(note: [nil, false])
  	.where.not(user_id: current_user.id)
  	.all.order("created_at DESC")

  	@comments = Comment.where(acknowleged: true)
  	.where.not(user_id: current_user.id)
  	.all.order("created_at DESC")

  	@comment = Comment.new

  end
end
