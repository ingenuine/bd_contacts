class Contact < ApplicationRecord
  include Auditable

  validates :case_id, { presence: true, uniqueness: true }

  def to_param
    case_id
  end
end
