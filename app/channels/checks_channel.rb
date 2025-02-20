class ChecksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "checks_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
