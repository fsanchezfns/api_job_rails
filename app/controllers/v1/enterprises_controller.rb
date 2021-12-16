class V1::EnterprisesController < ApplicationController

    def index
        @enterprises = Enterprise.all
        render(json:@enterprises)
    end

    def show

    end

    def create
        
    end

    def update

    end

    def user_params
        params.require(:enterprise).permit(:name,:nacionality)
    end 
end
