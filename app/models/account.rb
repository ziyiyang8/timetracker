class Account < ActiveRecord::Base
	validates :subdomain, presence: true,
						uniqueness: { case_sensitive: false },
						format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
						exclusion: { in: ['www'], message: 'restricted' }

	before_validation :downcase_subdomain

	belongs_to :owner, class_name: 'User'

	accepts_nested_attributes_for :owner
	validates :owner, presence: true

	private
		def downcase_subdomain
			self.subdomain = subdomain.try(:downcase)
		end
end
