class CommentsController < ApplicationController
    before_action :set_post, only: %i[create edit update destroy like_or_dislike ]
    before_action :set_comment, only: %i[edit update like_or_dislike destroy]
    # POST /posts or /posts.json
    def create
      @comment = @post.comments.new(comment_params)

      respond_to do |format|
        if @comment.save
          format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end
    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    def like_or_dislike
      if request.path.end_with?("dislike")
        @comment.dislike_count +=1
      else
        @comment.like_count +=1
      end

      respond_to do |format|
        if @comment.save
          format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @comment.destroy!

      respond_to do |format|
        format.html { redirect_to @post, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:post_id])
      end

      def set_comment
        @comment = @post.comments.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def comment_params
        params.require(:comment).permit(:content)
      end
  end
