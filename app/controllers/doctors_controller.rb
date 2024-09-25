class DoctorsController < ApplicationController

    def index
        doctors = ["Dr. Aman Singh", "Dr. Dheeraj Pratap", "Dr. Prakhar Pratap"]
        render json: { doctors: doctors }, status: :ok
    end

    def create
        doctor_name = params[:name]
        if doctor_name.present?
          render json: { message: "Doctor #{doctor_name} added successfully" }, status: :created
        else
          render json: { error: "Name is required" }, status: :unprocessable_entity
        end
    end
end
