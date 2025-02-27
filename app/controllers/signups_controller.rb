class SignupsController < ApplicationController
    def index
        signups = Signup.all
        render json: signups
    end

    def create
        signup = Signup.create!(signup_params)
        render json: signup
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    private
    
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
