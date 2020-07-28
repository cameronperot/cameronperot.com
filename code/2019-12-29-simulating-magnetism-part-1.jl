using Plots;
gr();
using LaTeXStrings

savepath = "/home/user/cameronperot.com/images/2019-12-29-simulating-magnetism-part-1";
save_bool = true
if save_bool
    dpi = 300
else
    dpi = 144
end

# %% energy plot

βs = range(0, stop = 5, length = 100)
e = -tanh.(βs);
plot_e = plot(
    βs,
    e,
    dpi = dpi,
    label = L"-\tanh\beta",
    xaxis = (L"\beta"),
    yaxis = (L"e"),
    line = (2, :dodgerblue, 0.8),
);

# %% heat capacity plot

c = βs .^ 2 ./ cosh.(βs) .^ 2;
plot_c = plot(
    βs,
    c,
    dpi = dpi,
    label = L"\beta^2 / \cosh^2 \beta",
    xaxis = (L"\beta"),
    yaxis = (L"c"),
    line = (2, :dodgerblue, 0.8),
);

# %% combined plot

plot_combined = plot(plot_e, plot_c, layout = (2, 1), size = (800, 600))

if save_bool
    savefig(plot_combined, joinpath(savepath, "1d_ising_e_c.png"))
end

plot_combined
