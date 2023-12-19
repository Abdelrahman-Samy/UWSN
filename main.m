%%%% This file contains the code related to the paper "AqNet: Fuzzy-driven Data Aggregation for Underwater Wireless Sensor Networks." 
%%%% The file is under construction 

close all;
clear;
clc;
PDR_AqNet=0;
Energy_tax_AqNet=0;
Avg_delay_AqNet=0;
avg_num=5;
%%%%%%%%%%%%%%%%%%%% Network Establishment Parameters %%%%%%%%%%%%%%%%%%%%
%%% Area of Operation %%%
% Field Dimensions in meters %
xm=1500;
ym=1500;
zm=1500;
x=0; 
y=0; 
z=0;
% Number of Nodes in the field %
n=100;
tx_range=100;  %maximum_transmission_range 
% Number of Dead Nodes in the beginning %
dead_nodes=0;
% Coordinates of the Sink (location is predetermined in this simulation) %
sinkx1=rand(1,1)*xm;
sinky1=rand(1,1)*ym;
sinkz1=zm;

sinkx2=rand(1,1)*xm;
sinky2=rand(1,1)*ym;
sinkz2=zm;


 h_size=11*8;     %%% Header size of DATA in bytes(11 bytes)
 payload=72*8;    %%% Payload of DATA in bytes(72 bytes)
 Datarate=16*1000; %%%bps
 Vnode=2;       %%% moVement speed of node in m/s
%%% Energy Values %%%
% Initial Energy of a Node (in Joules) % 
Eo=5; % units in Joules   
% Energy required to run circuity (both for transmitter and receiver) %
Eelec=50*10^(-9); % units in Joules/bit   
ETx=2; % units in Joules/bit  
ERx=0.75; % units in Joules/bit   
% Transmit Amplifier Types %
% Eamp=100*10^(-12)
Eamp=100*10^(-12); % units in Joules/bit/m^2 (amount of energy spent by the amplifier to transmit the bits)
% Data Aggregation Energy %
EDA=5*10^(-9); % units in Joules/bit   
% Size of data package %
k=2000; % units in bits    
% Suggested percentage of cluster head %
p=0.05; % a 5 percent of the total amount of nodes used in the network is proposed to give good results
% Number of Clusters %
No=int32(p*n); 
% Round of Operation %
rnd=0;
% Current Number of operating Nodes %
operating_nodes=n;
transmissions=0;
temp_val=0;
flag1stdead=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%% Creation of the Wireless Sensor Network %%%
% Plotting the WSN %
for i=1:n
    
    SN(i).id=i;	% sensor's ID number
    SN(i).x=rand(1,1)*xm;	% X-axis coordinates of sensor node
    SN(i).y=rand(1,1)*ym;	% Y-axis coordinates of sensor node
    SN(i).z=rand(1,1)*zm;
    SN(i).E=Eo;     
    SN(i).role=0;   
%     SN(i).cluster=0;	
    SN(i).cond=1;	
    SN(i).rop=0;	
    SN(i).rleft=0;  
    SN(i).dtch=0;	
    SN(i).dts=0;    
    SN(i).tel=0;	
    SN(i).rn=0;     
    SN(i).chid=0;   
    
    
    figure(1)
    plot3(x,y,z,xm,ym,zm,SN(i).x,SN(i).y,SN(i).z,'ob',sinkx1,sinky1,sinkz1,'*r',sinkx2,sinky2,sinkz2,'*r','MarkerSize', 12);
    hold on;
    title ('Underwater Wireless Sensor Network');
    xlabel ('Length(m)');
    ylabel ('Width(m)');
    zlabel ('Height(m)');
    
end
