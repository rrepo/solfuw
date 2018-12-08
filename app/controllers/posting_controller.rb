class PostingController < ApplicationController
    
    before_action :authenticate_user!, except:[:index,:show]
    
    def index
    @posting = Posting.all.order("created_at DESC").page(params[:page]).per(100)
    # ここから追記
        respond_to do |format| 
          format.html # html形式でアクセスがあった場合は特に何もなし(@messages = Message.allして終わり）
          format.json { @new_posting = Posting.where('id > ?', params[:postign][:id]) } # json形式でアクセスがあった場合は、params[:message][:id]よりも大きいidがないかMessageから検索して、@new_messageに代入する
        end
    end
    
    def new
    end
    
    def create
    Posting.create(text: posting_params[:text], user_id: current_user.id)
    Posting.create(genre: posting_params[:int])
    redirect_to "/"
    end
    
    def destroy
    posting = Posting.find(params[:id])
    posting.destroy if posting.user_id == current_user.id
    redirect_to "/posting/"
    end
    
    def edit
    @posting = Posting.find(params[:id])
    end
    
    def update
    @posting = Posting.find(params[:id])
    if @posting.user_id == current_user.id
    @posting.update(posting_params)
    end
    redirect_to "/posting/"
    end
    
    def show
    @posting = Posting.find(params[:id])
    @comments = @posting.comments.includes(:user)

    end
    
    private
    def posting_params
    params.permit(:text)
    end
end