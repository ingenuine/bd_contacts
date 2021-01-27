class AuditLogJob < ApplicationJob
  queue_as :default

  def perform(*args)
    AuditLogService.new(args).call
  end
end
