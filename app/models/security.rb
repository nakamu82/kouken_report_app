class Security < ApplicationRecord
  belongs_to :client

  validates :security_name, presence: true, unless: :kind_is_unknown?
  def kind_is_unknown?
    security_kind == "不明"
  end

end
