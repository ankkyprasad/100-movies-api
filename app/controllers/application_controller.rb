class ApplicationController < ActionController::API
  def user_auth
    header = request.headers['Authorization']
    @token = header.split(' ')[1] if header

    if JwtToken.find_by_token(@token)
      return render json: {error: 'unauthorized'}, status: :unauthorized
    end

    begin
      data = JwtHelper.decode(@token)
      @current_user = User.find_by_id!(data['user_id'])
    rescue JWT::DecodeError => e
      return render json: {error: 'unauthorized'}, status: :unauthorized
    end
  end

  def admin_role
    if @current_user.role != 'admin'
      render json: {error: 'unauthorized'}, status: :unauthorized
    end
  end
end
