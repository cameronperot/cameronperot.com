using MagSim
using Plots; gr()
using DataFrames
using CSV
using LaTeXStrings

# %%

βs = range(1e-3, stop=1, length=200);
Ls = [4, 8, 16, 32, 64];
prefix = "2020-02-29-simulating-magnetism-part-3";

@time sims = simulate_Ising_parallel(metropolis!, Ls, βs);
df = sim_dict_to_df(sims);
CSV.write(prefix * ".csv", df);

# %%

function plot_data(df::DataFrame)
	plots  = Dict()
	Os     = [:e, :c, :m, :χ]
	labels = [L"e", L"c", L"|m|", L"\chi"]
	Ls     = unique(df.L)

	for (i, O) in enumerate(Os)
		O ∈ [:e, :m] ? legend_bool = true : legend_bool = false
		p = plot(dpi=200,
			xaxis=(latexstring("\\beta")),
			yaxis=(labels[i]),
			legend=legend_bool,
			)

		colors = [:firebrick1, :orange, :forestgreen, :cyan3, :dodgerblue]
		for (i, L) in enumerate(Ls)
			df_ = df[(df.L .== L), :]
			x   = df_[:, :β]
			y   = df_[:, O]
			plot!(x, y,
				marker=(:star4, colors[i], 4, stroke(0)),
				line=(colors[i], 2),
				label=latexstring("L = $(string(L))"),
				)
		end

		plots[O] = p
	end

	return plots
end


plots = plot_data(df);
plot_e_c = plot(plots[:e], plots[:c], layout=(2, 1), size=(600, 500));
savefig(plot_e_c, "../images/" * prefix * "/ising_metropolis_e_c.png")
plot_m_χ = plot(plots[:m], plots[:χ], layout=(2, 1), size=(600, 500));
savefig(plot_m_χ, "../images/" * prefix * "/ising_metropolis_m_chi.png")
