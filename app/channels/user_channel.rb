class UserChannel < ApplicationCable::Channel
    def subscribed
        stream_from "userchannel_#{current_user.id}"
    end

    def send_message(data)
        ActionCable.server.broadcast('notes',data)
    end

    def receieve(data) 
        puts data
        ActionCable.server.broadcast('notes',data)
    end
end