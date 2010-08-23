class Organization < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true, :cache_column => 'name_slug', :approximate_ascii => true

	validates_presence_of :name, :contact, :city, :country, :password,  :announcer, :email
	validates_format_of :email, :with  => /[\w+-][\w.+-]*@\w+\.\w+/, :message => "wrong_mail_address"#, :if => Proc.new { |organization| !organization.email.empty?}
	validates_uniqueness_of :name

	has_and_belongs_to_many :tags
	
	def has_tag?(tag)
		not @tags.nil? and @tags.include?(tag)
	end

end
