class UsersController < ApplicationController
  require 'csv'

  def index
    @users = User.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.csv { send_users_csv(@users) }
    end
  end

  private

  def send_users_csv(users)
    csv_data = CSV.generate do |csv|
      column_names = User.column_names
      csv << column_names
      users.each do |user|
        column_values = user.attributes.values_at(*User.column_names)
        csv << column_values
      end
    end
    send_data(csv_data, filename: "users.csv")
  end
end
