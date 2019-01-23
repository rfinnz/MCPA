%Author: Richard Fucking Finney 100967048

global C

    addpath ../geom2d/geom2d

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665;                      %metres (32.1740 ft) per sÂ²

%2. Now write a simple 1D electron simulation tool:
%(a) For a single electron initialize a position at x = 0 and a velocity of v = 0;
%(b) Advance the electron in time updating it’s position and velocity with a force present.
%(c) Plot the position and velocity as a movie (use plot() and hold on)
%(d) Now assign a probability of scattering of 0.05 at each time step. Using rand() decide if it scattered
%during the last time step and if so set v back to 0. Show us the movie.
%(e) Calculate the drift velocity and display it in the title.
%(f) Play with the simulator. Make if run for many particles at the same time (make x and v vectors).
%(g) Try different scattering rules and see how that effects the average (drift) velocity

%a)
v_0 = 0;                                 %initial velocity                            
x = 0 ;                                   %initilizing position at x = 0;
y = 0;

x1 = 100;
y1 = 500;
F = 1;
%will represent the electron by it's x and y coordinates

electron = [x,y];
electron2 = [x1,y1];


%(b) Advance the electron in time updating it’s position and velocity with a force present.


v = 1;                                  %velocity once the electron begins to move
InitialAngle = 55 * pi / 180;            %initial angle that the electron is moving in
finaltime = 100;                        %total time of simulation
dt   = 1;                               
v_x = v*cos(InitialAngle);
v_y = v*sin(InitialAngle);

%(d) 

probability = 0.05;
 vdrift = 0;    %initial velocity drift is 0
%(c)

for time = 0:dt:finaltime
random= randi([1 100], 1, 1);
    

    plot(electron(1,1),electron(1,2),'or');
    hold on
    plot(electron2(1,1),electron2(1,2),'ob');
    hold on
    axis([0 1000 0 1000]);
    title(['The velocity of the electron is ', num2str(vdrift), ' m/s'])
    
if random <=5
    
    v_x =0;
    v_y =0;
    
end
    
    dvx = F*dt;
    v_x = v_x + dvx;  
    electron(1,1) = electron(1,1) + v_x*dt;
    electron2(1,1) = electron2(1,1) + v_x*dt;
    dvy = F*dt;
    v_y = v_y + dvy;
    electron(1,2) = electron(1,2) + v_y*dt;
    electron2(1,2) = electron2(1,2) + v_y*dt;
   
    if time > 0   
    vdrift= (vdrift + sqrt((v_x)^2+(v_y)^2))/time;
    end
    
    hold on
    pause(0.5);
   

end
