class CommentsController <  ApplicationController

  def index
    @comments = Comment.where('commentable_type=? and commentable_id =? ', commmentable_type_format_match , adjust_params)
    render json: @comments, status: :ok
  end

  def create
    @comment = Comment.new set_comment_params.merge(commentable_type: @data[:commentable_type].singularize.capitalize, user: current_user)
    if @comment.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  private
  def adjust_params
    return params[:lead_id] if params.has_key?(:lead_id)

    return params[:phase_id]
  end

  def commmentable_type_format_match
    params[:commentable_type].singularize.capitalize
  end

  def set_comment_params
    @data = params.require(:data).permit!
  end

end

