class NosvaleursController < ApplicationController
 skip_after_action :verify_policy_scoped
 skip_before_action :authenticate_user!

end
