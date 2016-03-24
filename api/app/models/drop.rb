class Drop < ActiveRecord::Base
  include AASM
  belongs_to :product
  has_many :joins, :through => :drop_joins
  has_and_belongs_to_many :users, as: :joins
  has_and_belongs_to_many :users, as: :commites

  aasm :column => 'state' do
    state :running, :initial => true
    state :ended
    state :done

    event :end do
      transitions :from => :running, :to => :ended
    end

    event :done do
      transitions :from => :ended, :to => :done
    end
  end

end 

