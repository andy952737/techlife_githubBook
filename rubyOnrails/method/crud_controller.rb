class Backend::CopyrightController < BackendController

    before_action :find_copyright, :only => [:new,:edit,:update,:destroy]
    
    def index
      @CopyRights = Copyright.mark.open
    end
   
    def new
      render layout: false
    end
  
    def create
      render plain: 'test value Ok!'
          return
    end
  
    def edit
      render layout: false
    end
  
    def update
      #redirect_to backend_categorys_path, flash: { message: "Update" }
    end
  
    def destroy
    end
  
    protected
  
    def copyright_params_permit
      params.require(:copyright).permit(:name,:parent_id,:url,:open_mark)
    end
  
    def find_copyright
      @CopyRight = params[:id] ? Copyright.find(params[:id]) : Copyright.new
    end
  
  end