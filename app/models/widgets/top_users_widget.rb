class TopUsersWidget < Widget
  validate :set_name, :on => :create
  field :settings, :type => Hash, :default => { :limit => 5, :on_welcome => true  }

  def top_users(group)
    group.users(:order => "membership_list.#{group.id}.reputation desc",
                :per_page => self[:settings][:limit],
                :page => 1)
  end

  protected
  def set_name
    self[:name] ||= "top_users"
  end
end
