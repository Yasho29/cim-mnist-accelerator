Badc=4;
R=3;
sigma_v=0.025;
scale_factor = 0.8 / R;
sigma_digital = sigma_v / scale_factor; 

sigbystep = sigma_digital/(R/2^Badc)
adcqn_noisebystep = 1/(12^0.5);
total_noisebystep = (sigbystep^2 + adcqn_noisebystep^2)^0.5;
effective_step = total_noisebystep*(12^0.5)
enob = Badc - ceil(log2(effective_step))
