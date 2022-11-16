class CommentsController <  ApplicationController

  def index
    @comments = Comment.where('commentable_type=? and commentable_id =? ', params[:commentable_type].singularize.capitalize , adjust_params)
    # byebug
    render json: @comments, status: :ok
  end

  def create

  end

  private
  def adjust_params
    return params[:lead_id] if params.has_key?(:lead_id)

    return params[:phase_id]
  end

end

# Comment.where('commentable_type=? and commentable_id =? ', 'Lead', params[:lead_id])

