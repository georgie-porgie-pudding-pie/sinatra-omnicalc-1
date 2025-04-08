require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @number_input = params.fetch("number").to_f
  @number_squared = @number_input ** 2
  erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number_input = params.fetch("user_number").to_f
  @number_rooted = @number_input ** 0.5
  erb(:square_root_result)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @number_min = params.fetch("user_min").to_f
  @number_max = params.fetch("user_max").to_f
  @number_random = rand(@number_min..@number_max)
  erb(:random_result)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr_input = params.fetch("user_apr").to_f
  @year_input = params.fetch("user_years").to_i
  @principal_input = params.fetch("user_pv").to_i

  @calc_rate = (@apr_input / 100) / 12
  @calc_n = @year_input * 12

  @numerator = @principal_input * @calc_rate
  @denominator = 1 - (1 + @calc_rate) ** (-@calc_n)

  @payment = @numerator / @denominator
  erb(:payment_result)
end
