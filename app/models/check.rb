# frozen_string_literal: true

class Check < ApplicationRecord
  belongs_to :url_monitor

  after_commit :broadcast_status_update, on: [:create]

  private

  def broadcast_status_update
    ActionCable.server.broadcast(
      "status_updates",
      {
        monitor_id: monitor.id,
        url: monitor.url,
        status: monitor.status,
        last_checked_at: monitor.last_checked_at,
        response_time: response_time
      }
    )
  end
end
