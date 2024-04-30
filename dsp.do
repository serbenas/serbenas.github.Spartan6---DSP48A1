vlib work
vlog top_level_ram.v top_level_ram_tb.v  +cover
vsim -voptargs=+acc work.top_level_ram_tb -cover
add wave *
coverage save top_level_ram_tb.ucdb -onexit
run -all