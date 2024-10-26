require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end 

get("/goodbye") do
 erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_i

  @the_result = params.fetch("users_number").to_f * params.fetch("users_number").to_f
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_i

  @the_result = Math.sqrt(params.fetch("users_number").to_f)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @APR = params.fetch("user_apr").to_i.to_fs(:percentage, { :precision => 4 } )
  @num_of_years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f.to_fs(:currency)
  @APR_decimal = params.fetch("user_apr").to_f / 100
  @monthly_rate = @APR_decimal/12
  @principal_float = params.fetch("user_pv").to_f
  @num_of_months = @num_of_years*12
  
  @numerator = @monthly_rate * @principal_float 
  @denominator = 1 - (1 + @monthly_rate)**(-@num_of_months)
  @results = (@numerator / @denominator).to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @results = rand(@min..@max)
  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
