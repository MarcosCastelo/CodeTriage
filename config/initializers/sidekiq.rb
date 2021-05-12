# frozen_string_literal: true

unless Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = {
      host: 'redis',
      port: '6379'
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      host: 'redis',
      port: '6379'
    }
  end
end

if Sidekiq.server?
  Rails.application.config.active_record.warn_on_records_fetched_greater_than = 1500
end