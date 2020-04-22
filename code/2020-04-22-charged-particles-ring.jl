using Plots; gr()
using LaTeXStrings

function velocity_verlet(x₀, v₀, a, τ, N, α)
	t = range(0, stop=N*τ, length=N+1)
	x = Float64[x₀]
	v = Float64[v₀]

	for n in 1:N
		push!(x, x[n] + τ * v[n] + τ^2 * a(x[n], α) / 2)
		push!(v, v[n] + τ * (a(x[n], α) + a(x[n + 1], α)) / 2)
	end

	return t, x, v
end

function acceleration(θ, α)
	return 9.81 * sin(θ) - (α / 2) * tan(θ / 2) * sec(θ / 2)
end

θs = range(0, stop=2π, length=1000)
xs = cos.(θs);
ys = sin.(θs);
function plot_system(x, y, α)
	global xs
	global ys
	scatter(xs, ys,
		title=(latexstring("\\alpha = $(α)")),
		aspect_ratio=true,
		marker=(:black, 1),
		legend=false,
		xaxis=(L"x"),
		yaxis=(L"y"), dpi=144,
		)
	scatter!([0], [-1], marker=(:red, 8))
	scatter!([x], [y], marker=(:red, 8))
end

function animate_system(t, θ, α)
	interval = 500
	θ        = θ[1:interval:end]
	t        = collect(t)[1:interval:end]
	x        = sin.(θ);
	y        = cos.(θ);

	i_last = nothing
	anim = @animate for i ∈ 1:length(x)
		if i > length(x) / 2 && round(θ[i], digits=2) ≈ round(θ₀, digits=2)
			i_last = i
			break
		end
	    plot_system(x[i], y[i], α)
	end

	fps = i_last / t[i_last]
	gif(anim, savepath * "animation_$(α).gif", fps = fps)
end

function plot_θ(t, θ, α)
	plot(t, θ, dpi=144,
		title=(latexstring("\\alpha = $(α)")),
		legend=false,
		xaxis=(L"t"),
		yaxis=(L"\theta", (minimum([0.9minimum(θ), 1.1minimum(θ)]), 1.1maximum(θ)))
		)
	savefig(savepath * "oscillation_$(α)")
end

function plot_system_(x, y)
	global xs
	global ys
	scatter(xs, ys,
		aspect_ratio=true,
		marker=(:black, 1),
		legend=false,
		xaxis=(L"x"),
		yaxis=(L"y"), dpi=144,
		)
	scatter!(xs[floor(Int, length(xs)/8):floor(Int, length(xs)/4)].*0.1, ys[floor(Int, length(xs)/8):floor(Int, length(xs)/4)].*0.1, marker=(:black, 1))
	x1 = range(0, stop=x, length=2)
	y1 = range(0, stop=y, length=2)
	plot!(x1, y1, line=(:black, 1))
	x2 = range(0, stop=1e-3, length=2)
	y2 = range(0, stop=1, length=2)
	plot!(x2, y2, line=(:black, 1))
	scatter!([0], [-1], marker=(:red, 8))
	scatter!([x], [y], marker=(:red, 8))
	annotate!((0.08, 0.2, L"\theta"))
	annotate!((x+0.1, y+0.1, L"q"))
	annotate!((0, -0.85, L"q'"))
	annotate!((-0.1, 0.5, L"r"))
	savefig(savepath * "system.png")
end

# %%

savepath = "../images/2020-04-22-charged-particles-ring/"
plot_system_(sin(π/4), cos(π/4))

θ₀ = π/4
ω₀ = 0
τ  = 1e-4
N  = 10^5
for α in [0.1, 1, 10, 100, 1000]
	t, θ, ω = velocity_verlet(θ₀, ω₀, acceleration, τ, N, α)
	animate_system(t, θ, α)
	plot_θ(t, θ, α)
end
