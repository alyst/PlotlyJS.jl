PlotlyBase.trace_map(p::SyncPlot, axis) = trace_map(p.plot, axis)
JSON.lower(sp::SyncPlot) = sp.plot

PlotlyBase._is3d(p::SyncPlot) = _is3d(p.plot)

# subplot methods on syncplot
arrange(layout::Layout, subplots::AbstractVector{<:SyncPlot}) =
    arrange(layout, plotobj.(subplots))
arrange(layout::Layout, subplots::SyncPlot...) = arrange(layout, plotobj.(subplots...))
arrange(subplots::AbstractArray{<:SyncPlot}) = arrange(plotobj.(subplots))

function PlotlyBase.add_recession_bands!(p::SyncPlot; kwargs...)
    new_shapes = add_recession_bands!(p.plot; kwargs...)
    relayout!(p, shapes=new_shapes)
    new_shapes
end
