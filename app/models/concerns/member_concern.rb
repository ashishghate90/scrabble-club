module MemberConcern
  extend ActiveSupport::Concern

  included do
    CONTACT_NUMBER_REGEX = /\b^([0-9]{10})$\b/
    validates :first_name, :last_name, presence: true
    validates_format_of :contact_number, uniqueness: true,
    :with => CONTACT_NUMBER_REGEX,
    :message => "- Phone numbers must be 10 digits & numbers."
     validates_uniqueness_of :contact_number

    has_many :wins, class_name: "Match", foreign_key: "winner_id"
    has_many :losses, class_name: "Match", foreign_key: "looser_id"
  end
end