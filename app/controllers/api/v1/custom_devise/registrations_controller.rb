module Api
  module V1
    module CustomDevise
      class RegistrationsController < Devise::RegistrationsController
        prepend_before_filter :require_no_authentication, :only => [ :create ]

        respond_to :json

        # POST /resource
        def create
          build_resource(sign_up_params)

          resource.role = 'user'
          resource.reset_authentication_token

          if resource.save
            if resource.active_for_authentication?
              sign_up(resource_name, resource)
              render json: {
                auth_token: resource.authentication_token,
                first_name: resource.first_name,
                last_name: resource.last_name,
                user_role: resource.role
              }, status: :created
            else
              render json: {errors: [resource.inactive_message]}, status: :created
            end
          else
            clean_up_passwords resource
            render json: {errors: resource.errors.full_messages}, status: :unprocessable_entity
          end
        end

        private

          def sign_up_params
            params.fetch(:user).permit([:password, :password_confirmation, :email, :first_name, :last_name])
          end

      end
    end
  end
end
