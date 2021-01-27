module Auditable
  extend ActiveSupport::Concern

  included do
    after_commit :log_create, on: :create
    after_commit :log_update, on: :update
    after_commit :log_destroy, on: :destroy
  end

  def log_create
    perform_log('create')
  end

  def log_update
    perform_log('update')
  end

  def log_destroy
    perform_log('destroy')
  end

  def perform_log(action)
    AuditLogJob.perform_later(self.case_id, action, user_id, changes)
  end

  def user_id
    nil
  end

  def changes
    self.previous_changes
  end
end
