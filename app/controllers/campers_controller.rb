class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        if camper 
            # We specify the serializer to be used. 
            render json: camper, serializer: CamperActivitySerializer
        else 
            render json: { error: "Camper not found"}, status: :not_found
        end
    end

    def create 
        # the bang operator giver you the activer record exception
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
        # rescue will tell you it's a unprocessable entity
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    # def create
    #     camper = Camper.create!(camper_params)
    #     render json: camper, status: :created
    #   rescue ActiveRecord::RecordInvalid => e
    #     render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    # end

    private

    # stong params
    def camper_params
        params.permit(:name, :age)
    end
end
