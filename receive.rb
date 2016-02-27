require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue("my_queue")

puts " [*] Waiting for messages in #{queue.name}. To exit press CTRL+C"
queue.subscribe(:block => true) do |delivery_info, properties, body|
  puts " [x] Received #{body}"


end
