class AuditLogService

  def initialize(*args)
    @args = args
  end

  def call
    send_message(message)
  end

  private

  def message
    [@args].join(' - ')
  end

  def send_message(message)
    #TODO: send or save
    Rails.logger.info message
  end
end
