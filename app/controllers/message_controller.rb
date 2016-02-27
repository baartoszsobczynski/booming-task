require "bunny"

class MessageController < ApplicationController

  def new

  end

  def send_msg
    @msg = params[:message]

    connection = Bunny.new
    connection.start
    channel = connection.create_channel

    queue = channel.queue("my_queue")
    channel.default_exchange.publish(@msg, routing_key: queue.name)

    connection.close
    render 'new'
  end

end
