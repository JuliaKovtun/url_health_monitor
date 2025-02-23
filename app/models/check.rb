# frozen_string_literal: true

class Check < ApplicationRecord
  belongs_to :url_monitor

  after_commit :broadcast_status_update, on: [:create]

  private

  def broadcast_status_update
    ActionCable.server.broadcast(
      "check_updates",
      {
        monitor_id: url_monitor.id,
        url: url_monitor.url,
        status: url_monitor.status,
        last_checked_at: url_monitor.last_checked_at,
        response_time: response_time
      }
    )
  end
end
