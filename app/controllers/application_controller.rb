class ApplicationController < ActionController::Base

  def current_order
    if current_user
      order = Order.where(user_id: current_user.id).where(state: "created").last
      if order.nil?
        order = Order.create(user: current_user, state: "created")
      end
      return order
    end

    nil
  end
end


# order = Order.find_or_create_by(user_id: current_user.id, state: 'created' )