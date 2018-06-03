class SessionsController < ApplicationController

    def index
        @sessions = Sessions.all
    end

    def show
    end

    def new
    end

    def create

        render 'new'
    end

    def destroy
    end
end