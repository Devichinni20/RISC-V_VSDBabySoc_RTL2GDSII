# Auto-highlight script for CTS visualization
# This script highlights clock tree and critical timing paths in VSDBabySoC

proc highlight_vsdbabysoc_cts {} {
    puts "=========================================="
    puts "VSDBabySoC CTS Visualization"
    puts "=========================================="
    puts "Highlighting Clock Tree and Timing Paths..."
    puts ""
    
    # Clear any previous highlights
    gui::clear_highlights
    
    # Highlight main clock network
    puts "  [1/4] Highlighting main clock (CLK)"
    catch {gui::highlight_net "CLK"}
    
    # Highlight clock tree buffers
    puts "  [2/4] Highlighting clock tree buffers"
    catch {gui::highlight_net "clknet_0_CLK"}
    catch {gui::highlight_net "clknet_5_6__leaf_CLK"}
    catch {gui::highlight_net "clknet_5_11__leaf_CLK"}
    catch {gui::highlight_net "clknet_5_15__leaf_CLK"}
    catch {gui::highlight_net "clknet_leaf_33_CLK"}
    catch {gui::highlight_net "clknet_leaf_55_CLK"}
    catch {gui::highlight_net "clknet_leaf_88_CLK"}
    
    # Highlight macros
    puts "  [3/4] Highlighting PLL and DAC macros"
    catch {gui::highlight_inst "pll"}
    catch {gui::highlight_inst "dac"}
    
    # Highlight critical path nets (from worst slack path)
    puts "  [4/4] Highlighting critical timing path"
    catch {gui::highlight_net "core.CPU_is_slli_a3"}
    catch {gui::highlight_net "_02607_"}
    catch {gui::highlight_net "net458"}
    catch {gui::highlight_net "_02728_"}
    catch {gui::highlight_net "_02733_"}
    catch {gui::highlight_net "_02736_"}
    catch {gui::highlight_net "_03411_"}
    catch {gui::highlight_net "_03413_"}
    catch {gui::highlight_net "_03414_"}
    catch {gui::highlight_net "_03415_"}
    catch {gui::highlight_net "_01061_"}
    
    # Zoom to fit all highlighted elements
    gui::fit
    
    puts ""
    puts "=========================================="
    puts "Highlighting Complete!"
    puts "=========================================="
    puts ""
    puts "Visual Guide:"
    puts "  • Clock network (CLK + buffers): Highlighted"
    puts "  • PLL macro at (200, 950): Highlighted"
    puts "  • DAC macro at (150, 250): Highlighted"
    puts "  • Critical timing path: Highlighted"
    puts ""
    puts "Timing Summary:"
    puts "  • Worst Slack: 6.55 ns (MET)"
    puts "  • Clock Period: 11.00 ns"
    puts "  • Clock Skew: -0.24 ns"
    puts ""
    puts "Commands:"
    puts "  • gui::clear_highlights  - Clear all highlights"
    puts "  • report_checks          - Show timing paths"
    puts "  • report_clock_skew      - Show clock skew"
    puts "  • gui::fit               - Zoom to fit"
    puts "=========================================="
}

# Auto-run on script load
highlight_vsdbabysoc_cts
