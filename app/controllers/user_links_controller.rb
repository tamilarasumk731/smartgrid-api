class UserLinksController < ApplicationController
  def create
    user = UserLink.new(user_params)
    if user.valid?
      UserLink.create(user_params)
      render json:{ success: true, message: "User Added successful", user: user_params}, status: :ok and return
    else
      render json: {success: false, message: "User Creation Fails", user: user_params} and return
    end
  end

  def post_user_data
    data = UserDatum.new(data_params)
    if data.valid?
      UserDatum.create(data_params)
      render json:{ success: true, message: "Data Added successful", user: data_params}, status: :ok and return
    else
      render json: {success: false, message: "Data Creation Fails", user: data_params} and return
    end
  end

  def update_user_data
    user_data = UserDatum.where(site: update_params[:site], user_link_id: update_params[:user])
    data_hash = JSON.parse(user_data.to_json)
    data_hash.each do |data|
      duration = find_duration update_params['end_time'], data['start_date']
      if data['end_time'].blank? && data['duration'].blank?
        user_data.update(end_date: update_params['end_time'], duration: duration)
      end
    end
    render json: {success: true, message: "Updated"} and return
  end

  def find_duration end_time, start_time
    Time.parse(end_time) - Time.parse(start_time)
  end

  def get_user_data
    data = UserDatum.find_by(user_link_id: search_param[:user])
    if data.present?
      render json: {success: true, message: "Data retrieval successful", user_data: data} and return
    else
      render json: {success: true, message: "Data retrieval Fails"} and return
    end
  end

  def index
    data = UserDatum.all
    render json: {success: true, message: "Data retrieval successful", user_data: data} and return
  end

  def analyse_data
    custom_data = {}
    custom_data[:site_duration] = []
    data_hash = JSON.parse(UserDatum.where(user_link_id: analyse_params[:user]).to_json)
    data_hash.each do |data|
      custom_data[:site_duration] << [data['current_url'], data['duration']]
    end
    custom_data[:favourite] = find_favourite data_hash
    custom_data[:total_time] = find_total_time data_hash
    custom_data[:no_sites] = find_no_sites data_hash
    custom_data[:productivity] = find_productivity data_hash
    render json: {success: true, message: "Data retrieval successful", custom_data: custom_data} and return
  end

  def find_favourite data_hash
    data_hash.max_by{|k| k['duration']}['current_url']
  end

  def find_total_time data_hash
    data_hash.map { |h| h['duration'] }.sum
  end

  def find_no_sites data_hash
    data_hash.count
  end

  def find_productivity data_hash
    80
  end

  private
  def user_params
    params.permit(:user_name, :user_mail )
  end

  def data_params
    params.permit(:user_link_id, :site, :current_url, :from_url, :lat, :lng, :duration, :start_date)
  end

  def search_param
    params.permit(:user)
  end

  def analyse_params
    params.permit(:user)
  end

  def update_params
    params.permit(:user, :end_time, :site) 
  end
end
