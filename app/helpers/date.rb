helpers do

def time_remaining(t)
	mm, ss = t.divmod(60)            #=> [4515, 21]
	hh, mm = mm.divmod(60)           #=> [75, 15]
	dd, hh = hh.divmod(24)           #=> [3, 3]
	"%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
end
end