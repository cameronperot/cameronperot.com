using MagSim
using Plots;
gr();
using DataFrames
using CSV
using LaTeXStrings


# %%


βs = range(1e-3, stop = 1, length = 201)
Ls = [4, 8, 16, 32, 64];
prefix = "2020-5-14-simulating-magnetism-part-4";

q = 2
@time sims = simulate_Potts_parallel(q, metropolis!, Ls, βs);
df = sim_dict_to_df(sims);
CSV.write(prefix * "_q=$(q).csv", df);


# %%


function plot_data(df, Os, y_limits, y_ticks)
    plots = Dict()
    labels = latexstring.(Os)
    Ls = unique(df.L)

    for (i, O) in enumerate(Os)
        O ∈ [:e] ? legend_bool = true : legend_bool = false
        p = plot(
            dpi = 200,
            xaxis = (latexstring("\\beta")),
            yaxis = (labels[i], y_limits[i], y_ticks[i]),
            legend = legend_bool,
        )

        colors = [:firebrick1, :orange, :forestgreen, :cyan3, :dodgerblue]
        for (i, L) in enumerate(Ls)
            df_ = df[(df.L.==L), :]
            x = df_[:, :β]
            y = df_[:, O]
            plot!(
                x,
                y,
                marker = (:star4, colors[i], 4, stroke(0)),
                line = (colors[i], 2),
                label = latexstring("L = $(string(L))"),
            )
        end

        plots[O] = p
    end

    return plots
end

Os = [:e, :c]
y_limits = [(-2.1, -0.9), (-0.1, 2.6)]
y_ticks = [-2:0.2:-1, 0:0.5:2.5]

plots = plot_data(df, Os, y_limits, y_ticks);
plot_e_c = plot(plots[:e], plots[:c], layout = (2, 1), size = (600, 500));
plot_e_c
savefig(plot_e_c, "../images/" * prefix * "/potts_2_metropolis_e_c.png")
