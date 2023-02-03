%---------------------------Generator Data---------------------------------
%generate count
nGen=3;

% fuel heat coefficient a b c, such that H=a+b*P+c*P^2
FUEL_HEAT_A=  [126.9,  176.9,  136.4];
FUEL_HEAT_B=  [13.5,   32.6,   17.6];
FUEL_HEAT_C=  [0.005,  0.001,  0.001];

%fuel cost      
FUEL_COST=[1,1,1];

%start up cost and shut down cost
START_UP_COST=[200;    300;    100]';
SHUT_DOWN_COST=[100;   300;    100]';

%Pmax
P_MAX=        [180;    160;    100];

%Pmin
P_MIN=        [100;    10;     10];

%minimum up/online time
MIN_ON_TIME=  [4;      3;      1];
%minimum down/offline time
MIN_OFF_TIME= [4;      2;      1];

%ramp_h
RAMP_UP_RATE= [10;     25;     5];
RAMP_DOWN_RATE=[10;    25;     5];

%ramp_10
RG_UP=RAMP_UP_RATE/6;
RG_DOWN=RAMP_DOWN_RATE/6;

%ramp online/offline
START_UP_RAMP_RATE=P_MIN;
SHUT_DOWN_RAMP_RATE=P_MIN;

%Generator node
GEN_NODE =    [1       2       6];

%---------------------------Wind Farm Data---------------------------------
WIND_FARM_NODE=[4];
selectedWindFarmNo=[6389];
nWindFarm=length(selectedWindFarmNo);
WIND_FARM_NODE=[4];
selectedWindFarmType=[1];
realWindFarmCapacity=[110];

%---------------------------Load Data--------------------------------------
Tload=       [219.19   235.35   234.67   236.73   239.06    244.48    273.39    290.40,...
              283.56   281.20   328.61   328.10   326.18    323.60    326.86    287.79,...
              260.00   246.74   255.97   237.35   243.31    283.14    283.05    248.75];
          
%        No. NodeNo. coefficient
LoadDist=[
         1	 3	     0.2
         2	 4	     0.4
         3	 5	     0.4
         ];
Load=LoadDist(:,3)*Tload;
LoadNodeNo=LoadDist(:,2);

%hours
nHour=size(Load,2);%hours

%---------------------------%network parameters----------------------------
%branches:k i   j   R       X       P_MAX Type(0:others(radiat or tie), 1:ring )
%         1 2   3   4       5       6    7
Branch = [1	1	2	0.005	0.17	200  1;%190
          2	2	3	0	    0.037	100  1;
          3	1	4	0.003	0.258	100  1;
          4	2	4	0.007	0.197	100  1;
          5	4	5	0	    0.037	100  1;
          6	5	6	0.002	0.14	100  1;
          7	3	6	0	    0.018	100  1];
nBranch = size(Branch,1);

%nodes:no   Vmin    Vmax
%       1   2       3
Node = [1	1.15	0.85;
        2	1.15	0.85;
        3	1.15	0.85;
        4	1.15	0.85;
        5	1.15	0.85;
        6	1.15	0.85];
nNode = size(Node,1);

%which node the generator connected
REF_NODE_NO=2;
%--------------------------initial status----------------------------------
T0=[4;2;1];%how long it been on or off according to UC0
UC0=[1;1;0];%UC at time 0